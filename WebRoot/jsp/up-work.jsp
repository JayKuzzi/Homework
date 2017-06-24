<%--
  Created by IntelliJ IDEA.
  User: bb
  Date: 2017/6/8
  Time: 14:47
  Info:上传作业
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%

    String user_china_name = "";
    String returnChinaName = "";
    user_china_name = (String) request.getSession().getAttribute("user_china_name");
    if (user_china_name == null)
        returnChinaName = "未登录";
    else
        returnChinaName = user_china_name;
%>
<html>
<head>
    <title>上 交 作 业</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="../js/up-work.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/up-work.css"/>
    <style>
        body {
            background-color: #f4f4f4;
            margin: 0px;
            overflow: hidden;
        }
        .LoR {
            height:205px;
            width:164px;
            overflow:hidden;
            background:url(images/logo.png) 0 0 no-repeat;
            position:absolute;
            top:50%;
            left:50%;
            margin:-102px auto auto -82px;
            z-index:2;
        }

    </style>
    <script type="text/javascript" src="../js/three.min.js"></script>



</head>
<body onload="bodyload();createCode()">
<script type="text/javascript">

    var container;
    var camera, scene, projector, renderer;

    var PI2 = Math.PI * 2;

    var programFill = function ( context ) {

        context.beginPath();
        context.arc( 0, 0, 1, 0, PI2, true );
        context.closePath();
        context.fill();

    }

    var programStroke = function ( context ) {

        context.lineWidth = 0.05;
        context.beginPath();
        context.arc( 0, 0, 1, 0, PI2, true );
        context.closePath();
        context.stroke();

    }

    var mouse = { x: 0, y: 0 }, INTERSECTED;

    init();
    animate();

    function init() {

        container = document.createElement( 'div' );
        container.id = 'bgc';
        container.style.position = 'relative';
        container.style.zIndex = '0';
        document.body.appendChild( container );

        camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 10000 );
        camera.position.set( 0, 300, 500 );

        scene = new THREE.Scene();

        for ( var i = 0; i < 100; i ++ ) {

            var particle = new THREE.Particle( new THREE.ParticleCanvasMaterial( { color: Math.random() * 0x808080 + 0x808080, program: programStroke } ) );
            particle.position.x = Math.random() * 800 - 400;
            particle.position.y = Math.random() * 800 - 400;
            particle.position.z = Math.random() * 800 - 400;
            particle.scale.x = particle.scale.y = Math.random() * 10 + 10;
            scene.add( particle );

        }

        projector = new THREE.Projector();

        renderer = new THREE.CanvasRenderer();
        renderer.setSize( window.innerWidth, window.innerHeight );

        container.appendChild( renderer.domElement );



        document.addEventListener( 'mousemove', onDocumentMouseMove, false );

        //

        window.addEventListener( 'resize', onWindowResize, false );

    }

    function onWindowResize() {

        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();

        renderer.setSize( window.innerWidth, window.innerHeight );

    }

    function onDocumentMouseMove( event ) {

        event.preventDefault();

        mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1;
        mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;

    }

    //

    function animate() {

        requestAnimationFrame( animate );

        render();

    }

    var radius = 600;
    var theta = 0;

    function render() {

        // rotate camera

        theta += 0.2;

        camera.position.x = radius * Math.sin( theta * Math.PI / 360 );
        camera.position.y = radius * Math.sin( theta * Math.PI / 360 );
        camera.position.z = radius * Math.cos( theta * Math.PI / 360 );
        camera.lookAt( scene.position );

        // find intersections

        camera.updateMatrixWorld();

        var vector = new THREE.Vector3( mouse.x, mouse.y, 0.5 );
        projector.unprojectVector( vector, camera );

        var ray = new THREE.Ray( camera.position, vector.subSelf( camera.position ).normalize() );

        var intersects = ray.intersectObjects( scene.children );

        if ( intersects.length > 0 ) {

            if ( INTERSECTED != intersects[ 0 ].object ) {

                if ( INTERSECTED ) INTERSECTED.material.program = programStroke;

                INTERSECTED = intersects[ 0 ].object;
                INTERSECTED.material.program = programFill;

            }

        } else {

            if ( INTERSECTED ) INTERSECTED.material.program = programStroke;

            INTERSECTED = null;

        }

        renderer.render( scene, camera );

    }

</script>
<p hidden><%=returnChinaName%></p>
<div class="div-reg">
    <form action="/Homework/UpWork" method="post" enctype="multipart/form-data" onsubmit="return do_it(this);">
        <table align="center" style="padding-top: 70px">
            <tr>
                <td><input onblur="checkNullForName()" type="text" placeholder="作业名称" name="workName" id="workName"
                           class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnull" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <select onblur="checkNullForTeacher()" class="box" name="workTeacher" id="workTeacher"
                            placeholder="批阅老师">
                        <option value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择批阅老师</option>
                        <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;张老师</option>
                        <option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;李老师</option>
                        <option value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;王老师</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForTeacher" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input onblur="checkNullForPhone()" onkeyup="value=this.value.replace(/\D+/g,'')" type="text"
                           placeholder="联系电话" name="workPhone" id="workPhone"
                           class="box"></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForPhone" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
            <tr>
                <td><input type="text" placeholder="备注信息（可不填）" name="workMess" id="workMess" class="box">
                </td>
            </tr>
            <tr>
                <td><input type="file" name="workFile" id="workFile" class="box4" onchange="getPhotoSize(this)"></td>
            </tr>
            <tr>
                <td><input onblur="checkNullForVerify()" type="text" name="verify2" id="verify2" placeholder="验证码"
                           class="box2"/>
                    <input type="button" id="code2" name="code2" onclick="createCodeAgain()" class="box3"/></td>
            </tr>
            <tr>
                <td>
                    <div id="isnullForVerify" style="color: #ff0000 ; font-size: 10px ;margin-top: -11px"></div>
                </td>
            </tr>
        </table>
        <div class="div-btn">
            <input type="submit" class="btn" value="上 交">
        </div>
        <div id="tip" style="display:none;text-align: center;color: #FC091B"> 或许您的文件过大，请耐心等待。。。</div>
    </form>
</div>

</body>
</html>
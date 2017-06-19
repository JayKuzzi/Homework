package com.bb.util;

import java.text.SimpleDateFormat;

/**
 * Created by bb on 2017/6/10.
 */
public class NowTime {

    public static String getNowDate() {
        java.util.Date nowdate = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return sdf.format(nowdate);
    }
}

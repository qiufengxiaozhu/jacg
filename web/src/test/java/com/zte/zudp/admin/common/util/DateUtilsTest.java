package com.zte.zudp.admin.common.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import org.junit.Assert;
import org.junit.Test;


/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-04-11.
 */
public class DateUtilsTest {

    @Test
    public void formatTimeNow() {
        System.out.println(DateUtils.formatDateNow());
    }

    @Test
    public void formatDateTimeNow() {
        System.out.println(DateUtils.formatDateTimeNow());
    }

    @Test
    public void formatDateNow() {
        System.out.println(DateUtils.formatDateNow());
    }

    @Test
    public void format() {
        System.out.println(DateUtils.format(LocalDateTime.now(), "yyyy-MM-dd HH:mm:ss.SSS"));
    }

    @Test
    public void parseDate() {
        LocalDate date = DateUtils.parseDate("2017-01-12");
        Assert.assertEquals(date, LocalDate.of(2017, 1, 12));
    }

    @Test
    public void parseTime() {
        LocalTime date = DateUtils.parseTime("12:01:01");
        Assert.assertEquals(date, LocalTime.of(12, 1, 1));
    }

    @Test
    public void parseDateTime() {
        LocalDateTime date = DateUtils.parseDateTime("2017-01-12 12:01:01");
        Assert.assertEquals(date, LocalDateTime.of(2017, 1, 12, 12, 1, 1));
    }

    @Test
    public void of() {
    }
}
package nl.waisda.utils;

import org.apache.log4j.MDC;

/**
 * 
 *
 */
public class Log4jPrefix {

    public static final void initialise(String userName, String userIP, String action, String userAgent, String referer) {

        MDC.put("userName", userName);
        MDC.put("userIP", userIP);
        MDC.put("action", action);
        MDC.put("userAgent", userAgent);
        MDC.put("referer", referer);
    }
    public static final void initialiseAction(String action) {
        MDC.put("action", action);
    }
}
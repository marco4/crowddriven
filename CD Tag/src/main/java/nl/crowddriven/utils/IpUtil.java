package nl.waisda.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

public abstract class IpUtil {

    public static String getClientIp(HttpServletRequest request) {
        String remoteIp = request.getHeader("X-Forwarded-For");
        if (notIpAddr(remoteIp)) {
            remoteIp = request.getHeader("X-Real-IP");
        }
        if (notIpAddr(remoteIp)) {
            remoteIp = request.getHeader("Proxy-Client-IP");
        }
        if (notIpAddr(remoteIp)) {
            remoteIp = request.getHeader("WL-Proxy-Client-IP");
        }
        if (notIpAddr(remoteIp)) {
            remoteIp = request.getHeader("HTTP_CLIENT_IP");
        }
        if (notIpAddr(remoteIp)) {
            remoteIp = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (notIpAddr(remoteIp)) {
            remoteIp = request.getRemoteAddr();
        }
        if (notIpAddr(remoteIp)) {
            remoteIp = request.getRemoteHost();
        }
        if (remoteIp == null || remoteIp.isEmpty()) {
            remoteIp = "unknown";
        }
        String[] ipArray = remoteIp.split(",");
        if (ipArray != null && ipArray.length > 1) {
            return ipArray[0];
        }
        return "0:0:0:0:0:0:0:1".equals(remoteIp) ? "127.0.0.1" : remoteIp;
    }


    private static boolean notIpAddr(String remoteIp) {
        return remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp);
    }

    public static String getServerIp() {
        String serverIp = "";
        try {
            serverIp = InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException e) {
            serverIp = "unknown host";
        }
        return serverIp;
    }
}
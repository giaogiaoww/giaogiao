package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101400684893";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQCcjCnxNk2pVGCEdEQp9o4bYl9SVOavqpwQSrGOK09K1yyol9VLJHANZ3TbaKFyYhqeOHClBsb/Yj8FxEwPMOmONcXQPC7debEQOAoDa4EFkKkTG9YU4TaxTUOvMQON0fZAFNolnK4n/r8b9flbe1RuHLuxyHULtZCAtuh2WLuzM78Dsrg+Qrz1c5uLwb31RRFvKCNPJRjXb+2fs1y4gbVtb6+6B0n673IScJA4LZdN/IXT/yTNe/wTks+Iph8udDNwAgQDE1xCus4NjzjdOygTLPxO6O0nZYyY6Kd4oaMiMT5wIVnXRykHD2lVj49sdljW24VQ5Wzk/LKorCDbxL91AgMBAAECggEBAJHjoZa0Z62c/5GQlJGSvx5QD8s3agBde7FHGq8GN4/kdS7syI6Nd4tWVbW/jW1+dZXrvTZd2YfYdCkYpVUm3RF1lVKZM4ecx+D4iIRlZEjeZmJzd4/fzktvWNtkTw6Uk+tmQ2H34OlO46TYFzkk9yrixhxJVqLB4tfBHWRlDw9RfDIV28tTYZlh83Ji/PUyyKg9GgKuYb9H8pghK2cHUwcL5eiC3w1YPTOJWQwMbu/G5FmMUlx+Gwty7fc/N6EPOjELfoRmWQDapFE2LW7MyxoWXamv8VvdJAYJ5TBuDBHHjojE+Cr6tuW1IHwZVR+zuVw00kfq1qyulu2yvMs4NGUCgYEA2/af+orcfr0/uv4lnH1xo/W3GJXgfdgrQmtMinuVqCsvnURaI4am0f+f+Fg6L8cTS7PoRMqiMjn14QZ9+YbKoddIU+z5urOsAX58EEmsvvCK8kIAVtfkrQfQziYGRkhjc0TYQ2rzucLXPZt4rMk82A1X3+Ii0fuQl1yNneLLT3cCgYEAtjHYeXt0LAQ8yxhZVRyRcuK2u+otgQGzXDbazctJHwIutwtHTioLrXdsNyCogEtJZdmVmV4C3RQhsIB3g9NinfTVCRP0YQIBMUhqXqf1u7Ws5pGOegSujJ58TZZHXJEF56MIQ+fz1540MkcCuzc71EIiXLF7JiQT9rqZBUwFm3MCgYEA0JsHQ2u4CzZdn3BxqQTK5m0clONnANImzJnIADmOR+uU/3gYaELGKLheNP8vR6pr4Uqgh8UIp8uSJTOr+x5bQ7tQq889U1QcV1pmPGgyvO6RR4lSmwmqpHKaEze6kaMLNgFffCiNNmnTCWlNu8gpvNiCsx/aV/xVN0ceQ1MX76cCgYEAqLsk9ezFO/Z4rsZQBSi98x3PidxoY+9FQoNyw+AeSd9lkBOb5+G8itvslmliY95VjUOi7jRIhqIcSS/Qf3+G9y5FFXErg6OtowyjpiH6y+qGw8nNn2cyl/w2tkwUrr+ILmuoPetUwj07rcxh1Sxj9kGBPUMI/9utuXQ6PtOW5c0CgYEAgSlWcVADOUVsbE3OgEiUQsgvTxqNOJxqSjzMaeswmUAvUPu6s1X8SrGD8snFjwrcE/wuENpYUEPuW0/E/fIYLXXbAtswH8PjK5B/dZ4uTUwTXAkbVTTWZ7w10CuJ13qOW35u+VG5VbQtI3u0Ql2s1+nSovhHUPrj542B2cqlbgc=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnIwp8TZNqVRghHREKfaOG2JfUlTmr6qcEEqxjitPStcsqJfVSyRwDWd022ihcmIanjhwpQbG/2I/BcRMDzDpjjXF0Dwu3XmxEDgKA2uBBZCpExvWFOE2sU1DrzEDjdH2QBTaJZyuJ/6/G/X5W3tUbhy7sch1C7WQgLbodli7szO/A7K4PkK89XObi8G99UURbygjTyUY12/tn7NcuIG1bW+vugdJ+u9yEnCQOC2XTfyF0/8kzXv8E5LPiKYfLnQzcAIEAxNcQrrODY843TsoEyz8TujtJ2WMmOineKGjIjE+cCFZ10cpBw9pVY+PbHZY1tuFUOVs5PyyqKwg28S/dQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}


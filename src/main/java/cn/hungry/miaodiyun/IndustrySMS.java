package cn.hungry.miaodiyun;

import java.net.URLEncoder;

import cn.hungry.config.MessageConfig;
import cn.hungry.util.HttpUtil;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS {

	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = MessageConfig.ACCOUNT_SID;
	private static String to = "13059264451";
	private static String smsContentHead = "【hungry外卖】尊敬的用户，您的验证码为:";
	private static String smsContentTail = "，请于30分钟内正确输入，如非本人操作，请忽略此短信。";

	/**
	 * 验证码通知短信
	 */
	public static void execute(String phone,String randomCode) {
		
		String tmpSmsContentHead = null;
		String code = null;
		String tmpSmsContentTail = null;
		String smsContent = null;
							
	    try{
	      tmpSmsContentHead = URLEncoder.encode(smsContentHead, "UTF-8");
	      code = URLEncoder.encode(randomCode, "UTF-8");
	      tmpSmsContentTail = URLEncoder.encode(smsContentTail, "UTF-8");
	      smsContent = tmpSmsContentHead + code + tmpSmsContentTail;
	      
	    }catch(Exception e){
	      
	    }
	    String url = MessageConfig.BASE_URL + operation;
	    String body = "accountSid=" + accountSid + "&to=" + phone + "&smsContent=" + smsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    System.out.println("result:" + System.lineSeparator() + result);
	}
}

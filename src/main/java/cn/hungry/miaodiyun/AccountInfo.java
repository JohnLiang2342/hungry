package cn.hungry.miaodiyun;

import cn.hungry.config.MessageConfig;
import cn.hungry.util.HttpUtil;

/**
 * 获取开发者账号信息接口调用示例
 * 
 * @ClassName: AccountInfo
 * @Description: 获取开发者账号信息接口调用示例
 *
 */
public class AccountInfo
{
	private static String operation = "/query/accountInfo";

	private static String accountSid = MessageConfig.ACCOUNT_SID;

	/**
	 * 获取开发者账号信息
	 */
	public static void execute()
	{
		String url = MessageConfig.BASE_URL + operation;
		String body = "accountSid=" + accountSid + HttpUtil.createCommonParam();

		// 提交请求
		String result = HttpUtil.post(url, body);
		System.out.println("result:" + System.lineSeparator() + result);
	}
}

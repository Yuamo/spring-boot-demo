package com.g_apple.commons.utils;

import java.util.UUID;

/**
 * 生成UUID
 */
public class UUIDGenerator
{    
    // [start] 获取UUID 并移除横线
    
    /**
     * 获取移除横线的UUID
     * 
     * @return 返回 移除横线后的UUID
     */
    public static String getUUID()
    {
	return UUID.randomUUID().toString().replace("-", "").toUpperCase();
    }
    
    // [end]
}

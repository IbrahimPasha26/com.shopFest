package com.shopFest.customer;

import com.shopFest.dbHandler.DataFetcher;

public class Validator 
{
	public static boolean isValid(String un, String pas)
	{
		String dbPass = DataFetcher.fetchPasswrod(un);
		if(pas.equals(dbPass))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}

@isTest 
private class TestVerifyDate {

    static testMethod void testCheckDates() {
        // TO DO: implement unit test        
        Date myDate = Date.newInstance(2017, 10, 27);
		Date newDate = mydate.addDays(2);
		Date endOfMonth =Date.newInstance(2017, 10, 31);
		
		system.assertEquals(endOfMonth,VerifyDate.CheckDates(newDate,myDate));
		system.assertEquals(newDate,VerifyDate.CheckDates(myDate,newDate));
		system.assertEquals(endOfMonth,VerifyDate.CheckDates(myDate,newDate.addDays(30)));
    }
 
}
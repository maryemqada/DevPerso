public class BoatSearchResults {

    @AuraEnabled
    public static list<String> getpickval() {
        set<String> options = new set<String>();

        for(BoatType__c boatType : [select name from BoatType__c order by name ASC]){
            options.add(boatType.name);
        }
        
        /*Schema.DescribeFieldResult fieldResult = BoatType__c.Name.getDescribe();

        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }  
	*/
        list<String> liOption = new list<String>();
        liOption.addAll(options);
        return liOption;
    }
    
     @AuraEnabled
    public static List<BoatType__c> getBoatTypes()
    {
        return [SELECT Id, Name from BoatType__c ORDER BY Name];
    }
    
    @AuraEnabled
    public static List<Boat__c> getBoats(String boatTypeId) {
        system.debug('@@qama '+ boatTypeId);
      if(boatTypeId != '' && boatTypeId != null)  {
             return [SELECT id, BoatType__c, picture__c, name,contact__r.Name
                    FROM Boat__c
                    WHERE BoatType__c ='a0F0O000017niK6UAI'];
      } else {
          return [SELECT id, BoatType__c, picture__c, name,contact__r.Name
                    FROM Boat__c];
      }
         }
}
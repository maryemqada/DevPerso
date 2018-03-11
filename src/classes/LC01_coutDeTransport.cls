/*
 * @author : MQ
 */
public with sharing class  LC01_coutDeTransport {

    /*
     * getCosts
     * description : gets the matrice of costs
     * return type : map<string,string>
	*/
    @AuraEnabled  
	public static map<string,integer> getCosts(){
		map<string,integer> mapCosts = new map<string,integer>();
        //loop through custom metadatypes to get the costs
        for(Couts_de_transport__mdt cost : [Select DeveloperName, MasterLabel, CoutDeTransport__c, DepartLivraison__c, DestinationLivraison__c                
               		from  Couts_de_transport__mdt]){
        	mapCosts.put((cost.DeveloperName).toUpperCase(),(integer)cost.CoutDeTransport__c );	
            
        }
        return mapCosts;
	}
    
   
    
    
    
}
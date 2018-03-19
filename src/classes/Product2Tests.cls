@isTest 
private class Product2Tests {

    /**
     * @name product2Extension_UnitTest
     * @description UnitTest for product2Extension
    **/
    static TestMethod void Product2Extension_UnitTest(){
    
        PageReference pageRef = Page.Product2New;
        Test.setCurrentPage(pageRef);
        
        List<Schema.PicklistEntry> familyEntries = Constants.PRODUCT_FAMILY;
        Integer familySize = familyEntries.size();
        
        ApexPages.StandardController stdController = new ApexPages.StandardController(new product2());
            Test.startTest();
                Product2Extension ext = new Product2Extension(stdController);
                
    //            System.assertEquals(ext.productsToInsert.size(), Constants.DEFAULT_ROWS);
                ext.addRows();
           //    System.assertEquals(ext.productsToInsert.size(), 2*Constants.DEFAULT_ROWS);
                
                for(Integer I=0; I < Constants.DEFAULT_ROWS; I++){
                    ext.productsToInsert[i].productRecord.Name = 'test Product' +I;
                    ext.productsToInsert[i].productRecord.IsActive = true;
                    ext.productsToInsert[i].productRecord.Initial_Inventory__c = 100;
                    ext.productsToInsert[i].productRecord.Family = familyEntries[(familySize - 1) - Math.mod(i, familySize)].value;
                    ext.productsToInsert[i].pricebookEntryRecord.UnitPrice = 30;
                }
                
                ext.save();
                List<Product2> prodList = [Select Id, Name From Product2 ];
                System.assertEquals(Constants.DEFAULT_ROWS , prodList.size());
                
                ext.GetFamilyOptions();
                
                ext.GetInventory();
                
            Test.stopTest();
    }
    
    public static TestMethod void Product2Trigger_UnitTest(){
         Integer productCount = [SELECT Count() FROM Product2];
         Integer pricebookCount = [SELECT Count() FROM PricebookEntry];
         PageReference pageRef = Page.Product2New;
         Test.setCurrentPage(pageRef);
         product2Extension ext = new product2Extension(new apexPages.standardController(new Product2()));
         ext.addRows();
         ext.addRows();
         ext.productsToInsert[0].productRecord.Name = 'TestTestTest';
         ext.productsToInsert[0].productRecord.Family = 'Entree';
         ext.productsToInsert[0].pricebookEntryRecord.UnitPrice = 1;
         ext.productsToInsert[0].pricebookEntryRecord.IsActive = true;
         ext.productsToInsert[0].productRecord.Initial_Inventory__c = 10;
         ext.save();
         
         system.assert( productCount+1 == [SELECT Count() FROM Product2] );
         system.assert( pricebookCount+1 == [SELECT Count() FROM PricebookEntry]);
         
         delete [SELECT Id FROM Product2 WHERE Name = 'TestTestTest'];
    }

}
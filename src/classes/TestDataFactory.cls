/**
 * @name TestDataFactory
 * @description Contains methods to construct and/or validate commonly used records
**/
public without sharing class TestDataFactory {
    /**
     * @name ConstructCollaborationGroup
     * @description
    **/
     public static CollaborationGroup constructCollaborationGroup(){
        //ToDo: Ensure this method returns a single Chatter CollaborationGroup
        //    whose Name starts with 'TEST' followed by the INVENTORY_ANNOUNCEMENTS constant
        //    and configured so anyone can join, see and post updates.
        CollaborationGroup ChatterGroup = new CollaborationGroup(
              Name = 'TEST'+Constants.INVENTORY_ANNOUNCEMENTS,  
              CollaborationType = 'Public',
             // CanHaveGuests = true,
              IsArchived = false,
              IsAutoArchiveDisabled = true
        );
        return ChatterGroup;
     }

    /**
     * @name CreateProducts
     * @description Constructs a list of Product2 records for unit tests
    **/
     public static List<Product2> ConstructProducts(Integer cnt){
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Product2 records
        //  with all the required fields populated
        //  and IsActive = true
        //  an Initial Inventory set to 10
        //  and iterating through the product family picklist values throughout the list.
        List<Product2> products=new List<Product2>();
        Integer s=0;
        for(Integer n=0; n<cnt; n++)
        {
            if(s==4) 
                s=0;
            
            Product2 p=new Product2();
            p.Name='Product1_'+n;
            p.Family=Constants.PRODUCT_FAMILY[s].value;
            p.Initial_Inventory__c=10;
            p.IsActive=true;
            //p.Quantity_Ordered__c=Constants.DEFAULT_ROWS;
            products.add(p);
            
            s++;
            
        }
        
        return products;
    }

    /**
     * @name CreatePricebookEntries
     * @description Constructs a list of PricebookEntry records for unit tests
    **/
    public static List<PricebookEntry> ConstructPricebookEntries(List<Product2> prods){
        //ToDo: Ensure this method returns a corresponding list of PricebookEntries records
        //  related to the provided Products
        //  with all the required fields populated
        //  and IsActive = true
        //  and belonging to the standard Pricebook
        List<PricebookEntry> pbeList = new List<PricebookEntry>();
        for(Product2 prod : prods){
            PricebookEntry PBE = new PricebookEntry();
            PBE.UnitPrice = 20;
            PBE.Product2Id = prod.Id;
            PBE.PriceBook2Id = Constants.STANDARD_PRICEBOOK_ID;
            PBE.isActive = true;
            pbeList.add(PBE);
        }
        return pbeList;
    }

    /**
     * @name CreateAccounts
     * @description Constructs a list of Account records for unit tests
    **/
    public static List<Account> ConstructAccounts(Integer cnt){
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Account records
        //  with all of the required fields populated.
        List<Account> accountList = new List<Account>();
        For(Integer I = 0; I < cnt; I++){
            Account acc = new Account(Name = 'Test Account '+I);
            accountList.add(acc);
        }
        return accountList;
    }

    /**
     * @name CreateContacts
     * @description Constructs a list of Contacxt records for unit tests
    **/
    public static List<Contact> ConstructContacts(Integer cnt, List<Account> accts){
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Contact records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<Contact> contactList = new List<Contact>();
        For(Integer I = 0; I < cnt; I++){
            Contact con = new Contact();
            con.FirstName = 'Test ' +I ;
            con.LastName = ' Contact' + System.Now();
            con.AccountId = accts[I].Id;
            contactList.add(con);
        }
        return contactList;
    }

    /**
     * @name CreateOrders
     * @description Constructs a list of Order records for unit tests
    **/
    public static List<Order> ConstructOrders(Integer cnt, List<Account> accts){
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Order records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<Order> orderList = new List<Order>();
        For(Integer I = 0; I < cnt; I++){
            Order ord = new Order();
            ord.EffectiveDate = System.Today();
            ord.PriceBook2Id = Constants.STANDARD_PRICEBOOK_ID;
            ord.AccountId = accts[I].Id;
            ord.Status = Constants.DRAFT_ORDER_STATUS;
            orderList.add(ord);
        }
        return orderList;
    }

    /**
     * @name CreateOrderItems
     * @description Constructs a list of OrderItem records for unit tests
    **/
    public static List<OrderItem> ConstructOrderItems(integer cnt, list<pricebookentry> pbes, list<order> ords){
        //ToDo: Ensure this method returns a list of size cnt of OrderItem records
        //  related to the provided Pricebook Entries
        //  and related to the provided Orders
        //  with all of the required fields populated.
        //  Hint: Use the DEFAULT_ROWS constant for Quantity as it will be used in the next challenge
        List<OrderItem> ordItem = new List<OrderItem>();
        For(Integer I = 0; I < cnt; I++){
            OrderItem item = new OrderItem();
            item.Quantity = Constants.DEFAULT_ROWS;
            item.OrderId = ords[I].Id;
            item.PricebookEntryId = PBEs[I].Id;
            item.UnitPrice = 30;
            ordItem.add(item);
        }
        return ordItem;
    }
    

    /**
     * @name SetupTestData
     * @description Inserts accounts, contacts, Products, PricebookEntries, Orders, and OrderItems.
    **/
    public static void InsertTestData(Integer cnt){
        //ToDo: Ensure this method calls each of the construct methods
        //  and inserts the results for use as test data.
        CollaborationGroup cg = constructCollaborationGroup();
        insert cg;
        list<Account> accounts = ConstructAccounts(cnt);
        Insert accounts;
        
        list<Contact> contacts = ConstructContacts(cnt, accounts);
        insert contacts;
        
        list<Product2> prods= ConstructProducts(cnt);
        insert prods;
        
        list<PriceBookEntry> entries = ConstructPricebookEntries(prods);
        insert entries;
        
        list<Order> orders = ConstructOrders(cnt, accounts);
        insert orders;
        
        list<OrderItem> ordItems = ConstructOrderItems(cnt, entries, orders);
        insert ordItems;     
    }

}
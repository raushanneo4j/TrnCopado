{
	"BusinessIdentificationNo":"12345",
	"Client":"AvaTaxSample,1.0,0,test,1.0,12345",
	"CompanyCode":"APITrialCompany",
	"CurrencyCode":"USD",
	"CustomerCode":"ABC4335",
	"CustomerUsageType":"G",
	"Discount":120.35,
	"DocCode":"INV001",
	"DocDate":"2014-01-01",
	"ExemptionNo":"12345",
	"LocationCode":"42",
	"PurchaseOrderNo":"PO123456",
	"TaxOverride":{
		"Reason":"Tax Date Override",
		"TaxDate":"2012-01-01",
		"TaxOverrideType":"TaxDate"
	},
	"Addresses":[{
		"AddressCode":"01",
		"City":"San Francisco",
		"Line1":"45 Fremont Street",
		"Region":"CA"
	},{
		"AddressCode":"02",
		"City":"Chicago",
		"Country":"US",
		"Line1":"118 N Clark St",
		"Line2":"Suite 100",
		"Line3":"ATTN Accounts Payable",
		"PostalCode":"60602",
		"Region":"IL"
	},{
		"AddressCode":"03",
		"City":"Harrogate",
		"Country":"UK",
		"Line1":"2 Cardale Park",
		"Line2":"Beckwith Head Road",
		"Line3":"ATTN H6",
		"PostalCode":"HG3 1RY",
		"Region":"IO93fx"
	},{
		"AddressCode":"04",
		"City":"Andalucia",
		"Country":"ES",
		"Line1":"Av. San Rafael"
	}],
	"Lines":[{
		"Amount":10,
		"Description":"Red Size 7 Widget",
		"DestinationCode":"02",
		"Discounted":"true",
		"ItemCode":"N543",
		"LineNo":"01",
		"OriginCode":"01",
		"Qty":1
	},{
		"Amount":150,
		"Description":"Size 10 Green Running Shoe",
		"DestinationCode":"03",
		"Discounted":"true",
		"ItemCode":"T345",
		"LineNo":"02",
		"OriginCode":"01",
		"Qty":3,
		"TaxCode":"07"
	},{
		"Amount":200,
		"Description":"Size 12 Pink Running Shoe",
		"DestinationCode":"03",
		"Discounted":"true",
		"ItemCode":"T345",
		"LineNo":"03",
		"OriginCode":"01",
		"Qty":3,
		"TaxCode":"07"
	},{
		"Amount":12,
		"Description":"General Purpose Widget",
		"DestinationCode":"04",
		"Discounted":"false",
		"ItemCode":"N543",
		"LineNo":"04",
		"OriginCode":"03",
		"Qty":2
	},{
		"Amount":15,
		"Description":"Shipping Charge",
		"DestinationCode":"04",
		"ItemCode":"FREIGHT",
		"LineNo":"05-FR",
		"OriginCode":"02",
		"Qty":1
	}]
}

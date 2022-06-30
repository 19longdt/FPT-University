create View viewProduct
as
select p.ProductID, p.Name, p.Color,
case
when ph.StandardCost = null then 'Not defined'
when ph.StandardCost < 100 then '0-100'
when ph.StandardCost >= 100 and  ph.StandardCost < 200 then '100-200'
when ph.StandardCost >= 200 and  ph.StandardCost < 300 then '200-300'
when ph.StandardCost >= 300 and  ph.StandardCost < 400 then '300-400'
when ph.StandardCost >= 400 and  ph.StandardCost < 500 then '400-500'
when ph.StandardCost >= 500 and  ph.StandardCost < 600 then '500-600'
when ph.StandardCost >= 600 and  ph.StandardCost < 700 then '600-700'
when ph.StandardCost >= 700 and  ph.StandardCost < 800 then '700-800'
when ph.StandardCost >= 800 and  ph.StandardCost < 900 then '800-900'
when ph.StandardCost >= 900 and  ph.StandardCost < 1000 then '900-1000'
when ph.StandardCost >= 1000 and  ph.StandardCost < 2000 then '1000-2000'
when ph.StandardCost >= 2000 and  ph.StandardCost < 3000 then '2000-3000'
when ph.StandardCost >= 3000 and  ph.StandardCost < 4000 then '3000-4000'
else '>= 4000'
end as StandardCostRange
, 
case
when lp.ListPrice = null then 'Not defined'
when lp.ListPrice < 100 then '0-100'
when lp.ListPrice >= 100 and  lp.ListPrice < 200 then '100-200'
when lp.ListPrice >= 200 and  lp.ListPrice < 300 then '200-300'
when lp.ListPrice >= 300 and  lp.ListPrice < 400 then '300-400'
when lp.ListPrice >= 400 and  lp.ListPrice < 500 then '400-500'
when lp.ListPrice >= 500 and  lp.ListPrice < 600 then '500-600'
when lp.ListPrice >= 600 and  lp.ListPrice < 700 then '600-700'
when lp.ListPrice >= 700 and  lp.ListPrice < 800 then '700-800'
when lp.ListPrice >= 800 and  lp.ListPrice < 900 then '800-900'
when lp.ListPrice >= 900 and  lp.ListPrice < 1000 then '900-1000'
when lp.ListPrice >= 1000 and  lp.ListPrice < 2000 then '1000-2000'
when lp.ListPrice >= 2000 and  lp.ListPrice < 3000 then '2000-3000'
when lp.ListPrice >= 3000 and  lp.ListPrice < 4000 then '3000-4000'
else '>= 4000'
end as ListPriceRange
,
case
when isnull(p.Weight, 0) = 0 then 'Not defined'
when p.Weight <= 50 then '0-50'
when p.Weight > 50 and  p.Weight <= 100 then '50-100'
when p.Weight > 100 and  p.Weight <= 150 then '100-150'
when p.Weight > 150 and  p.Weight <= 200 then '150-200'
when p.Weight > 200 and  p.Weight <= 250 then '200-250'
when p.Weight > 250 and  p.Weight <= 300 then '250-300'
else '>= 300'
end as WeightRange
,
isnull(p.Size, 'Not defined') as Size, u.Name as SizeUnitMeasureName, u1.Name as WeightUnitMeasureName, p.ProductLine, 
p.Class, p.Style, c.Name as CategoryName, sc.Name as SubcategoryName, pm.Name as ModelName,
ph.StartDate as checkStrDate, ph.EndDate as checkEndDate, ph.StandardCost as StandardCostHis
from Production.Product p
left join Production.ProductSubcategory sc on sc.ProductSubcategoryID = p.ProductSubcategoryID
left join Production.ProductCategory c on c.ProductCategoryID = sc.ProductCategoryID
left join Production.UnitMeasure u on p.SizeUnitMeasureCode = u.UnitMeasureCode
left join Production.UnitMeasure u1 on p.WeightUnitMeasureCode = u1.UnitMeasureCode
left join Production.ProductModel pm on pm.ProductModelID = p.ProductModelID
left join Production.ProductCostHistory ph on ph.ProductID = p.ProductID
left join Production.ProductListPriceHistory lp on lp.ProductID = p.ProductID

create View viewCustomer
as 
with t as(
SELECT 
    i.BusinessEntityID
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        TotalPurchaseYTD[1]', 'money') AS [TotalPurchaseYTD] 
    ,CONVERT(datetime, REPLACE([IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        DateFirstPurchase[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [DateFirstPurchase] 
    ,CONVERT(datetime, REPLACE([IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        BirthDate[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [BirthDate] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        MaritalStatus[1]', 'nvarchar(1)') AS [MaritalStatus] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        YearlyIncome[1]', 'nvarchar(30)') AS [YearlyIncome] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        Gender[1]', 'nvarchar(1)') AS [Gender] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        TotalChildren[1]', 'integer') AS [TotalChildren] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        NumberChildrenAtHome[1]', 'integer') AS [NumberChildrenAtHome] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        Education[1]', 'nvarchar(30)') AS [Education] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        Occupation[1]', 'nvarchar(30)') AS [Occupation] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        HomeOwnerFlag[1]', 'bit') AS [HomeOwnerFlag] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        NumberCarsOwned[1]', 'integer') AS [NumberCarsOwned] 
FROM [Person].[Person] i 
CROSS APPLY i.[Demographics].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
    /IndividualSurvey') AS [IndividualSurvey](ref) 
WHERE [Demographics] IS NOT NULL)

select p.BusinessEntityID as CustomerId, isnull(p.Title, '') as Title, p.FirstName, isnull(p.MiddleName, '') as MiddleName, p.LastName, 
Case when t.Gender = 'F' THEN 'Female' ELSE 'Male' END as Gender, cast(t.BirthDate as Date) as BirthDate,
Case when t.MaritalStatus = 'S' THEN 'Single' ELSE 'Married' END as MaritalStatus, e.EmailAddress,
t.YearlyIncome, t.TotalChildren, t.NumberChildrenAtHome, t.Education, t.Occupation,
Case when t.HomeOwnerFlag = 1 THEN 'Yes' ELSE 'No' END as HomeOwnerFlag , t.NumberCarsOwned, 
a.AddressLine1, isnull(a.AddressLine2, '') as AddressLine2, a.City, a.PostalCode, sp.Name as 'State', cr.Name as 'Country', pp.PhoneNumber
from t
left join Person.Person p on t.BusinessEntityID = p.BusinessEntityID
left  join Person.EmailAddress e on e.BusinessEntityID = p.BusinessEntityID
left  join Person.BusinessEntityAddress ba on ba.BusinessEntityID = p.BusinessEntityID
left  join Person.Address a on a.AddressID = ba.AddressID
left  join Person.StateProvince sp on sp.StateProvinceID = a.StateProvinceID
left  join Person.CountryRegion cr on cr.CountryRegionCode = sp.CountryRegionCode
left  join Person.PersonPhone pp on pp.BusinessEntityID = p.BusinessEntityID
where p.PersonType = 'IN'



--select * from t1
join viewProduct p on p.ProductID = t1.ProductID and p.CategoryName = t1.CategoryName 
and p.Class = t1.Class and p.Color = t1.Color
where t1.OrderDate between t1.checkStrDate and t1.checkEndDate and t1.SalesOrderID = 43660 and t1.CustomerID = 29672




with t as(
select Datediff(DAY, cast(s.OrderDate as Date), cast(s.ShipDate as date)) as ShipDuration,
case
when Datediff(DAY, cast(s.DueDate as Date), cast(s.ShipDate as date)) < 0 then 0
else Datediff(DAY, cast(s.DueDate as Date), cast(s.ShipDate as date)) 
end as ShipDelay,
s.TotalDue as Amount,
(s.TotalDue - s.TaxAmt - s.Freight - vp.StandardCostHis * sd.OrderQty) as Margin,
s.TaxAmt, sd.UnitPrice, s.Freight,
vp.*,
vc.*,
cur.CurrencyCode, so.SpecialOfferID, so.DiscountPct, so.Type, so.MinQty, so.MaxQty, cast(so.StartDate as Date) StartDate, cast(so.EndDate as Date) EndDate, 
cast(s.OrderDate as Date) OrderDate, cast(s.DueDate as Date) DueDate, cast(s.ShipDate as Date) as ShipDate, c.Name as CountryName, 
st.TerritoryID, st.[Group] as GroupName, st.Name as RegionName
from Sales.SalesOrderHeader s
join Sales.SalesTerritory st on st.TerritoryID = s.TerritoryID
join Person.CountryRegion c on c.CountryRegionCode = st.CountryRegionCode
join Sales.CountryRegionCurrency crc on crc.CountryRegionCode = st.CountryRegionCode
join Sales.SalesOrderDetail sd on sd.SalesOrderID = s.SalesOrderID
join viewProduct vp on vp.ProductID = sd.ProductID
join Sales.Customer sc on sc.CustomerID = s.CustomerID
left join viewCustomer vc on vc.CustomerId = sc.PersonID
join Sales.SpecialOffer so on so.SpecialOfferID = sd.SpecialOfferID
join Sales.Currency cur on cur.CurrencyCode = crc.CurrencyCode
where s.OrderDate between vp.checkStrDate and vp.checkEndDate and s.OnlineOrderFlag = 1
)
select ShipDuration, ShipDelay, sum(Amount) as Amount, sum(Margin) as Margin, sum(TaxAmt) as TaxAmt, sum(UnitPrice) as UnitPrice, sum(Freight) as Freight, 
ProductID, Name as ProductName, Color, StandardCostRange, ListPriceRange, WeightRange, Size, SizeUnitMeasureName, WeightUnitMeasureName, ProductLine, Class, Style,
CategoryName, SubcategoryName, ModelName, CustomerId, Title, FirstName, MiddleName, LastName, Gender, BirthDate, MaritalStatus, EmailAddress,
[YearlyIncome] ,[TotalChildren],[NumberChildrenAtHome],[Education], Occupation,[HomeOwnerFlag] ,[NumberCarsOwned] ,[AddressLine1],[AddressLine2],[City],[State]
,[PostalCode],[Country],[PhoneNumber], CurrencyCode, SpecialOfferID, [DiscountPct],[Type],[MinQty] ,[MaxQty],[StartDate],[EndDate],
OrderDate, ShipDate, DueDate, CountryName, TerritoryID, GroupName, RegionName
from t
group by ShipDuration, ShipDelay, Amount, Margin, TaxAmt, UnitPrice, Freight, ProductID, Name,
Color, StandardCostRange, ListPriceRange, WeightRange, Size, SizeUnitMeasureName, WeightUnitMeasureName, ProductLine, Class, Style,
CategoryName, SubcategoryName, ModelName, CustomerId, Title, FirstName, MiddleName, LastName, Gender, BirthDate, MaritalStatus, EmailAddress,
[YearlyIncome] ,[TotalChildren],[NumberChildrenAtHome],[Education], Occupation,[HomeOwnerFlag] ,[NumberCarsOwned] ,[AddressLine1],[AddressLine2],[City],[State]
,[PostalCode],[Country],[PhoneNumber], CurrencyCode, SpecialOfferID, [DiscountPct],[Type],[MinQty] ,[MaxQty],[StartDate],[EndDate],
OrderDate, ShipDate, DueDate, CountryName, TerritoryID, GroupName, RegionName




select * from 
Production.ProductListPriceHistory where ProductID = 717

select *, EndDate + 1 from 
Production.ProductCostHistory where ProductID = 717

select StandardCost, ListPrice, ModifiedDate from 
Production.Product where ProductID = 717

select CustomerID, UnitPrice, LineTotal, h.OrderDate from [Sales].[SalesOrderDetail] d
join Sales.SalesOrderHeader h on h.SalesOrderID = d.SalesOrderID
where ProductID = 779 and CustomerID = 11000 and  Year(OrderDate) = 2012

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT sh.SalesOrderID, sh.SubTotal, sh.TaxAmt, sh.Freight, sh.TotalDue, sd.ProductID, sd.OrderQty, sd.UnitPrice, sd.UnitPriceDiscount, sd.LineTotal,
ph.StandardCost, sh.OrderDate, ph.StartDate, ph.EndDate, sh.CustomerID

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] sh
  join [Sales].SalesOrderDetail sd on sd.SalesOrderID = sh.SalesOrderID
  join Production.ProductCostHistory ph on ph.ProductID = sd.ProductID
  where sh.OrderDate between ph.StartDate and ph.EndDate and sh.CustomerID = 15992


  SELECT sh.SalesOrderID, sh.SubTotal, sh.TaxAmt, sh.Freight, sh.TotalDue, sd.ProductID, sd.OrderQty, sd.UnitPrice, sd.UnitPriceDiscount, sd.LineTotal

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] sh
  join [Sales].SalesOrderDetail sd on sd.SalesOrderID = sh.SalesOrderID
  where sh.SalesOrderID = 43660 or sh.SalesOrderID = 43663

  select * from Production.ProductCostHistory
  where ProductID = 762 and  cast('2011-05-31 00:00:00.000' as Date) between StartDate and EndDate



CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `orderhistory` AS
    SELECT 
        `c`.`CustomerID` AS `CustomerID`,
        `c`.`CustomerName` AS `CustomerName`,
        `o`.`OrderID` AS `OrderID`,
        `p`.`ProductID` AS `ProductID`,
        `p`.`ProductName` AS `ProductName`,
        `od`.`Quantity` AS `Quantity`,
        `o`.`OrderDate` AS `OrderDate`,
        `os`.`StatusName` AS `StatusName`
    FROM
        ((((`customers` `c`
        LEFT JOIN `orders` `o` ON ((`c`.`CustomerID` = `o`.`CustomerID`)))
        LEFT JOIN `orderdetails` `od` ON ((`o`.`OrderID` = `od`.`OrderID`)))
        LEFT JOIN `orderstatus` `os` ON ((`o`.`OrderStatusID` = `os`.`StatusID`)))
        LEFT JOIN `products` `p` ON ((`od`.`ProductID` = `p`.`ProductID`)))
    ORDER BY `o`.`OrderDate` DESC
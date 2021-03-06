CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `showorderstatus` AS
    SELECT 
        `c`.`CustomerName` AS `CustomerName`,
        `o`.`OrderID` AS `orderid`,
        `p`.`ProductName` AS `ProductName`,
        `od`.`Quantity` AS `Quantity`,
        `os`.`StatusName` AS `StatusName`,
        `o`.`ShippingDate` AS `ShippingDate`,
        `ps`.`StatusName` AS `Payment`
    FROM
        (((((`customers` `c`
        LEFT JOIN `orders` `o` ON ((`c`.`CustomerID` = `o`.`CustomerID`)))
        LEFT JOIN `orderdetails` `od` ON ((`o`.`OrderID` = `od`.`OrderID`)))
        LEFT JOIN `orderstatus` `os` ON ((`o`.`OrderStatusID` = `os`.`StatusID`)))
        LEFT JOIN `products` `p` ON ((`od`.`ProductID` = `p`.`ProductID`)))
        LEFT JOIN `paystatus` `ps` ON ((`o`.`PayStatus` = `ps`.`ID`)))
    WHERE
        ((`o`.`OrderID` IS NOT NULL)
            AND (`os`.`StatusName` <> 'delivered'))
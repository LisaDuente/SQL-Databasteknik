CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `quantityinwarehouse` AS
    SELECT 
        `p`.`ProductName` AS `ProductName`,
        SUM(`ws`.`Quantity`) AS `TotalQuantity`
    FROM
        (`products` `p`
        LEFT JOIN `warehousestatus` `ws` ON ((`p`.`ProductID` = `ws`.`ProductID`)))
    GROUP BY `p`.`ProductID`
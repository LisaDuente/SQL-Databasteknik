CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `contactinfoemployees` AS
    SELECT 
        `p`.`PersonalName` AS `PersonalName`,
        `p`.`Phone` AS `Phone`,
        `p`.`Email` AS `Email`,
        `d`.`DepartmentName` AS `DepartmentName`,
        `p`.`Position` AS `Position`
    FROM
        (`personal` `p`
        LEFT JOIN `departments` `d` ON ((`p`.`DepartmentID` = `d`.`DepartmentID`)))
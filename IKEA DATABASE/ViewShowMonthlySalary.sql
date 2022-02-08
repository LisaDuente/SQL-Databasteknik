CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `showmonthlysalary` AS
    SELECT 
        `p`.`PersonalName` AS `PersonalName`,
        `r`.`WorkedHours` AS `WorkedHours`,
        (`s`.€/hr * `r`.WorkedHours) AS Salary,
        `r`.Date AS Date
    FROM
        ((personal p
        JOIN reportedhours r ON ((`p`.PersonalID = `r`.PersonalID)))
        JOIN salary s ON ((`p`.SalaryID = `s`.ID)))
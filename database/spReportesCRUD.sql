USE HOTELES;

DELIMITER //

CREATE PROCEDURE spReportesCRUD (
  pAccion INT
)
BEGIN
  CASE  
    WHEN pAccion = 1 THEN 
      SELECT USU.IdUsuario AS USUARIO, USU.Nombre AS NOMBRE, USU.APaterno AS APELLIDO, COUNT(DISTINCT CLI.IdCliente) AS CLIENTES_REGISTRADOS
      FROM USUARIO AS USU
      INNER JOIN CLIENTE AS CLI ON USU.IdUsuario = CLI.IdUsuario
      GROUP BY USU.IdUsuario;
    WHEN pAccion = 2 THEN 
      SELECT RES.IdCliente AS CLIENTE, CLI.Nombre AS NOMBRE, CLI.APaterno AS APELLIDO, COUNT(CLI.IdCliente) AS RESERVACIONES
      FROM CLIENTE AS CLI
      INNER JOIN RESERVACION AS RES ON CLI.IdCliente = RES.IdCliente
      GROUP BY CLI.IdCliente;
	  WHEN pAccion = 3 THEN 
      SELECT THAB.Descrip AS HABITACION, COUNT(HAB.IdTipoHabitacion) AS REGISTRO_HABITACIONES
      FROM HABITACION AS HAB
      INNER JOIN TIPOHABITACION AS THAB ON HAB.IdTipoHabitacion = THAB.IdTipoHabitacion
      GROUP BY HAB.IdTipoHabitacion;
  END CASE;
END //

DELIMITER ;

-- CALL spReportesCRUD();
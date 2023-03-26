SELECT C.NUME + ' ' + C.PRENUME AS CLIENT, SUM(SUMA) AS SUMA, SUM(SUMA_DISC) AS DISCOUNT, 
	SUM(SUMA_TOTAL) AS TOTAL, NR_CEC, DATA_CEC

FROM CEC INNER JOIN VANZARE V ON V.CEC_ID = CEC.CEC_ID
		 INNER JOIN CLIENT C ON C.CLIENT_ID = CEC.CLIENT_ID
  -- WHERE CAST(DATA_CEC AS DATE) BETWEEN :D1 AND :D2
GROUP BY C.NUME + ' ' + C.PRENUME, NR_CEC, DATA_CEC
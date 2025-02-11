-- Ex 1
SELECT C.CUSTOMER_ID
FROM CUSTOMERS C
JOIN ORDERS O ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN EVENTS E ON E.EVENT_ID = O.EVENT_ID
WHERE TO_CHAR(E.EVENT_DATE, 'YYYY, Month') LIKE '%2021%December%';

-- Ex 2
SELECT T.TITLE, COUNT(A.ACTOR_ID) AS NR_ACTORI
FROM ACTORS A
JOIN PLAYS_ACTORS PA ON PA.ACTOR_ID = A.ACTOR_ID
JOIN (SELECT P.TITLE, P.PLAY_ID
      FROM ACTORS A
               JOIN PLAYS_ACTORS PA ON PA.ACTOR_ID = A.ACTOR_ID
               JOIN PLAYS P ON P.PLAY_ID = PA.PLAY_ID
      WHERE UPPER(GENRE) LIKE '%DRAMA%'
        AND UPPER(A.PLACE_OF_BIRTH) NOT LIKE '%BUCURESTI%') T ON T.PLAY_ID = PA.PLAY_ID
group by T.TITLE;

-- Ex 3
SELECT P.TITLE, AVG(C.CUSTOMER_ID) AS NR_SPECTATORI_MEDIE
FROM PLAYS P
JOIN EVENTS E ON E.PLAY_ID = P.PLAY_ID
JOIN ORDERS O ON O.EVENT_ID = E.EVENT_ID
JOIN CUSTOMERS C ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY P.TITLE;

-- Ex 4
SELECT P.TITLE, COUNT(DISTINCT A.ACTOR_ID) AS NR_ACTORI, COUNT(DISTINCT E.EVENT_ID) AS NR_EVENIMENTE
FROM PLAYS P
JOIN EVENTS E ON E.PLAY_ID = P.PLAY_ID
JOIN PLAYS_ACTORS PA ON P.PLAY_ID = PA.PLAY_ID
JOIN ACTORS A ON A.ACTOR_ID = PA.ACTOR_ID
WHERE TO_CHAR(E.EVENT_DATE, 'YYYY') LIKE '%2021%'
GROUP BY P.TITLE;

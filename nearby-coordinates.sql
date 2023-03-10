---
METHOD 1

This should roughly sort the items on distance in MySQL, and should work in SQLite.
If you need to sort them preciser, you could try using the Pythagorean theorem (a^2 + b^2 = c^2) to get the exact distance.
---
SELECT *
FROM table
ORDER BY ((lat-$user_lat)*(lat-$user_lat)) + ((lng - $user_lng)*(lng - $user_lng)) ASC

---
METHOD 2
---
SELECT
    id, (
      6371 * acos (
      cos ( radians($user_lat) )
      * cos( radians( lat ) )
      * cos( radians( lng ) - radians($user_lng) )
      + sin ( radians($user_lat) )
      * sin( radians( lat ) )
    )
) AS distance
FROM table
HAVING distance < 30
ORDER BY distance
LIMIT 0 , 20;
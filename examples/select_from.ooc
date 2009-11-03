use sqlite3
import sqlite3/[Sqlite3, ResultCodes]

main: func {
  db := Sqlite3 new("asd.db")
  stmt := db prepare("select * from stuff")
  stmt toString() println()
  res := stmt step()
  while(res==Sqlite3Code row){
    stmt columnName(0) println()
    stmt intColumn(0) toString() println()  
    stmt columnName(1) println()
    stmt intColumn(1) toString() println()
    
    res = stmt step()
  }
  stmt finalize()
  db close()
}


import sqlite3/Sqlite3

main: func {
  db := Sqlite3 new("asd.db")
  stmt := db prepare("create table stuff(asd,zxc);")
  res := stmt step()
  stmt finalize()
  db close()
}


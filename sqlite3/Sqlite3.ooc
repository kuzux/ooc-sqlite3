include sqlite3
import resultcodes

SqliteStruct: cover from sqlite3*
SqliteStmtStruct: cover from sqlite3_stmt*

SqliteStmt: cover from SqliteStmtStruct {
  step: extern(sqlite3_step) func -> Int
  finalize: extern(sqlite3_finalize) func -> Int
  reset: extern(sqlite3_reset) func -> Int
  new: static func -> This {
    this := gc_malloc(This size) as This
    return this
  }

  intColumn: extern(sqlite3_column_int) func(Int) -> Int
  int64Column: extern(sqlite3_column_int64) func(Int) -> Int64
  textColumn: extern(sqlite3_column_text) func(Int) -> String
  blobColumn: extern(sqlite3_column_blob) func(Int) -> Pointer
  doubleColumn: extern(sqlite3_column_blob) func(Int) -> Double
}

Sqlite3: cover from SqliteStruct {
  _open: static extern(sqlite3_open) func(String, Sqlite3*) -> Int
  new: static func(file: String) -> This {
    this : This
    This _open(file, this&)
    return this
  }
  initialize: extern(sqlite3_initialize) static func -> Int
  close: extern(sqlite3_close) func -> Int

  errcode: extern(sqlite3_errcode) func -> Int
  errmsg: extern(sqlite3_errmsg) func -> String

  _prepare: extern(sqlite3_prepare_v2) func(String, Int, SqliteStmt*, const Char**) -> Int
  prepare: func(query: String) -> SqliteStmt {
    res : SqliteStmt
    this _prepare(query, -1, res&, null)
    return res
  }
}


Sqlite3Code: cover {
  ok:          extern(SQLITE_OK) extern Int          /* Successful result */
/* beginning-of-error-codes */
  error:       extern(SQLITE_ERROR) extern Int       /* SQL error or missing database */
  internal:    extern(SQLITE_INTERNAL) extern Int    /* Internal logic error in SQLite */
  perm:        extern(SQLITE_PERM) extern Int        /* Access permission denied */
  abort:       extern(SQLITE_ABORT) extern Int       /* Callback routine requested an abort */
  busy:        extern(SQLITE_BUSY) extern Int        /* The database file is locked */
  locked:      extern(SQLITE_LOCKED) extern Int      /* A table in the database is locked */
  nomem:       extern(SQLITE_NOMEM) extern Int       /* A malloc() failed */
  readonly:    extern(SQLITE_READONLY) extern Int    /* Attempt to write a readonly database */
  interrupt:   extern(SQLITE_INTERRUPT) extern Int   /* Operation terminated by sqlite3_interrupt()*/
  ioerr:       extern(SQLITE_IOERR) extern Int       /* Some kind of disk I/O error occurred */
  corrupt:     extern(SQLITE_CORRUPT) extern Int     /* The database disk image is malformed */
  notfound:    extern(SQLITE_NOTFOUND) extern Int    /* NOT USED. Table or record not found */
  full:        extern(SQLITE_FULL) extern Int        /* Insertion failed because database is full */
  cantopen:    extern(SQLITE_CANTOPEN) extern Int    /* Unable to open the database file */
  protocol:    extern(SQLITE_PROTOCOL) extern Int    /* NOT USED. Database lock protocol error */
  empty:       extern(SQLITE_EMPTY) extern Int       /* Database is empty */
  schema:      extern(SQLITE_SCHEMA) extern Int      /* The database schema changed */
  toobig:      extern(SQLITE_TOOBIG) extern Int      /* String or BLOB exceeds size limit */
  constraint:  extern(SQLITE_CONSTRAINT) extern Int  /* Abort due to constraint violation */
  mismatch:    extern(SQLITE_MISMATCH) extern Int    /* Data type mismatch */
  misuse:      extern(SQLITE_MISUSE) extern Int      /* Library used incorrectly */
  nolfs:       extern(SQLITE_NOLFS) extern Int       /* Uses OS features not supported on host */
  auth:        extern(SQLITE_AUTH) extern Int        /* Authorization denied */
  format:      extern(SQLITE_FORMAT) extern Int      /* Auxiliary database format error */
  range:       extern(SQLITE_RANGE) extern Int       /* 2nd parameter to sqlite3_bind out of range */
  notadb:      extern(SQLITE_NOTADB) extern Int      /* File opened that is not a database file */
  row:         extern(SQLITE_ROW) extern Int         /* sqlite3_step() has another row ready */
  done:        extern(SQLITE_DONE) extern Int        /* sqlite3_step() has finished executing */
}

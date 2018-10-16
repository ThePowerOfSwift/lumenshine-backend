// Code generated by SQLBoiler (https://github.com/volatiletech/sqlboiler). DO NOT EDIT.
// This file is meant to be re-generated in place and/or deleted at any time.

package horizon

import (
	"database/sql"
	"fmt"
	"reflect"
	"strconv"
	"strings"
	"sync"
	"time"

	"github.com/pkg/errors"
	"github.com/volatiletech/sqlboiler/boil"
	"github.com/volatiletech/sqlboiler/queries"
	"github.com/volatiletech/sqlboiler/queries/qm"
	"github.com/volatiletech/sqlboiler/strmangle"
)

// HistoryTransactionParticipant is an object representing the database table.
type HistoryTransactionParticipant struct {
	ID                   int   `boil:"id" json:"id" toml:"id" yaml:"id"`
	HistoryTransactionID int64 `boil:"history_transaction_id" json:"history_transaction_id" toml:"history_transaction_id" yaml:"history_transaction_id"`
	HistoryAccountID     int64 `boil:"history_account_id" json:"history_account_id" toml:"history_account_id" yaml:"history_account_id"`

	R *historyTransactionParticipantR `boil:"-" json:"-" toml:"-" yaml:"-"`
	L historyTransactionParticipantL  `boil:"-" json:"-" toml:"-" yaml:"-"`
}

var HistoryTransactionParticipantColumns = struct {
	ID                   string
	HistoryTransactionID string
	HistoryAccountID     string
}{
	ID:                   "id",
	HistoryTransactionID: "history_transaction_id",
	HistoryAccountID:     "history_account_id",
}

// HistoryTransactionParticipantRels is where relationship names are stored.
var HistoryTransactionParticipantRels = struct {
}{}

// historyTransactionParticipantR is where relationships are stored.
type historyTransactionParticipantR struct {
}

// NewStruct creates a new relationship struct
func (*historyTransactionParticipantR) NewStruct() *historyTransactionParticipantR {
	return &historyTransactionParticipantR{}
}

// historyTransactionParticipantL is where Load methods for each relationship are stored.
type historyTransactionParticipantL struct{}

var (
	historyTransactionParticipantColumns               = []string{"id", "history_transaction_id", "history_account_id"}
	historyTransactionParticipantColumnsWithoutDefault = []string{"history_transaction_id", "history_account_id"}
	historyTransactionParticipantColumnsWithDefault    = []string{"id"}
	historyTransactionParticipantPrimaryKeyColumns     = []string{"id"}
)

type (
	// HistoryTransactionParticipantSlice is an alias for a slice of pointers to HistoryTransactionParticipant.
	// This should generally be used opposed to []HistoryTransactionParticipant.
	HistoryTransactionParticipantSlice []*HistoryTransactionParticipant
	// HistoryTransactionParticipantHook is the signature for custom HistoryTransactionParticipant hook methods
	HistoryTransactionParticipantHook func(boil.Executor, *HistoryTransactionParticipant) error

	historyTransactionParticipantQuery struct {
		*queries.Query
	}
)

// Cache for insert, update and upsert
var (
	historyTransactionParticipantType                 = reflect.TypeOf(&HistoryTransactionParticipant{})
	historyTransactionParticipantMapping              = queries.MakeStructMapping(historyTransactionParticipantType)
	historyTransactionParticipantPrimaryKeyMapping, _ = queries.BindMapping(historyTransactionParticipantType, historyTransactionParticipantMapping, historyTransactionParticipantPrimaryKeyColumns)
	historyTransactionParticipantInsertCacheMut       sync.RWMutex
	historyTransactionParticipantInsertCache          = make(map[string]insertCache)
	historyTransactionParticipantUpdateCacheMut       sync.RWMutex
	historyTransactionParticipantUpdateCache          = make(map[string]updateCache)
	historyTransactionParticipantUpsertCacheMut       sync.RWMutex
	historyTransactionParticipantUpsertCache          = make(map[string]insertCache)
)

var (
	// Force time package dependency for automated UpdatedAt/CreatedAt.
	_ = time.Second
)

var historyTransactionParticipantBeforeInsertHooks []HistoryTransactionParticipantHook
var historyTransactionParticipantBeforeUpdateHooks []HistoryTransactionParticipantHook
var historyTransactionParticipantBeforeDeleteHooks []HistoryTransactionParticipantHook
var historyTransactionParticipantBeforeUpsertHooks []HistoryTransactionParticipantHook

var historyTransactionParticipantAfterInsertHooks []HistoryTransactionParticipantHook
var historyTransactionParticipantAfterSelectHooks []HistoryTransactionParticipantHook
var historyTransactionParticipantAfterUpdateHooks []HistoryTransactionParticipantHook
var historyTransactionParticipantAfterDeleteHooks []HistoryTransactionParticipantHook
var historyTransactionParticipantAfterUpsertHooks []HistoryTransactionParticipantHook

// doBeforeInsertHooks executes all "before insert" hooks.
func (o *HistoryTransactionParticipant) doBeforeInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantBeforeInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpdateHooks executes all "before Update" hooks.
func (o *HistoryTransactionParticipant) doBeforeUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantBeforeUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeDeleteHooks executes all "before Delete" hooks.
func (o *HistoryTransactionParticipant) doBeforeDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantBeforeDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpsertHooks executes all "before Upsert" hooks.
func (o *HistoryTransactionParticipant) doBeforeUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantBeforeUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterInsertHooks executes all "after Insert" hooks.
func (o *HistoryTransactionParticipant) doAfterInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantAfterInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterSelectHooks executes all "after Select" hooks.
func (o *HistoryTransactionParticipant) doAfterSelectHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantAfterSelectHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpdateHooks executes all "after Update" hooks.
func (o *HistoryTransactionParticipant) doAfterUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantAfterUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterDeleteHooks executes all "after Delete" hooks.
func (o *HistoryTransactionParticipant) doAfterDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantAfterDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpsertHooks executes all "after Upsert" hooks.
func (o *HistoryTransactionParticipant) doAfterUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range historyTransactionParticipantAfterUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// AddHistoryTransactionParticipantHook registers your hook function for all future operations.
func AddHistoryTransactionParticipantHook(hookPoint boil.HookPoint, historyTransactionParticipantHook HistoryTransactionParticipantHook) {
	switch hookPoint {
	case boil.BeforeInsertHook:
		historyTransactionParticipantBeforeInsertHooks = append(historyTransactionParticipantBeforeInsertHooks, historyTransactionParticipantHook)
	case boil.BeforeUpdateHook:
		historyTransactionParticipantBeforeUpdateHooks = append(historyTransactionParticipantBeforeUpdateHooks, historyTransactionParticipantHook)
	case boil.BeforeDeleteHook:
		historyTransactionParticipantBeforeDeleteHooks = append(historyTransactionParticipantBeforeDeleteHooks, historyTransactionParticipantHook)
	case boil.BeforeUpsertHook:
		historyTransactionParticipantBeforeUpsertHooks = append(historyTransactionParticipantBeforeUpsertHooks, historyTransactionParticipantHook)
	case boil.AfterInsertHook:
		historyTransactionParticipantAfterInsertHooks = append(historyTransactionParticipantAfterInsertHooks, historyTransactionParticipantHook)
	case boil.AfterSelectHook:
		historyTransactionParticipantAfterSelectHooks = append(historyTransactionParticipantAfterSelectHooks, historyTransactionParticipantHook)
	case boil.AfterUpdateHook:
		historyTransactionParticipantAfterUpdateHooks = append(historyTransactionParticipantAfterUpdateHooks, historyTransactionParticipantHook)
	case boil.AfterDeleteHook:
		historyTransactionParticipantAfterDeleteHooks = append(historyTransactionParticipantAfterDeleteHooks, historyTransactionParticipantHook)
	case boil.AfterUpsertHook:
		historyTransactionParticipantAfterUpsertHooks = append(historyTransactionParticipantAfterUpsertHooks, historyTransactionParticipantHook)
	}
}

// OneG returns a single historyTransactionParticipant record from the query using the global executor.
func (q historyTransactionParticipantQuery) OneG() (*HistoryTransactionParticipant, error) {
	return q.One(boil.GetDB())
}

// One returns a single historyTransactionParticipant record from the query.
func (q historyTransactionParticipantQuery) One(exec boil.Executor) (*HistoryTransactionParticipant, error) {
	o := &HistoryTransactionParticipant{}

	queries.SetLimit(q.Query, 1)

	err := q.Bind(nil, exec, o)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "horizon: failed to execute a one query for history_transaction_participants")
	}

	if err := o.doAfterSelectHooks(exec); err != nil {
		return o, err
	}

	return o, nil
}

// AllG returns all HistoryTransactionParticipant records from the query using the global executor.
func (q historyTransactionParticipantQuery) AllG() (HistoryTransactionParticipantSlice, error) {
	return q.All(boil.GetDB())
}

// All returns all HistoryTransactionParticipant records from the query.
func (q historyTransactionParticipantQuery) All(exec boil.Executor) (HistoryTransactionParticipantSlice, error) {
	var o []*HistoryTransactionParticipant

	err := q.Bind(nil, exec, &o)
	if err != nil {
		return nil, errors.Wrap(err, "horizon: failed to assign all query results to HistoryTransactionParticipant slice")
	}

	if len(historyTransactionParticipantAfterSelectHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterSelectHooks(exec); err != nil {
				return o, err
			}
		}
	}

	return o, nil
}

// CountG returns the count of all HistoryTransactionParticipant records in the query, and panics on error.
func (q historyTransactionParticipantQuery) CountG() (int64, error) {
	return q.Count(boil.GetDB())
}

// Count returns the count of all HistoryTransactionParticipant records in the query.
func (q historyTransactionParticipantQuery) Count(exec boil.Executor) (int64, error) {
	var count int64

	queries.SetSelect(q.Query, nil)
	queries.SetCount(q.Query)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return 0, errors.Wrap(err, "horizon: failed to count history_transaction_participants rows")
	}

	return count, nil
}

// ExistsG checks if the row exists in the table, and panics on error.
func (q historyTransactionParticipantQuery) ExistsG() (bool, error) {
	return q.Exists(boil.GetDB())
}

// Exists checks if the row exists in the table.
func (q historyTransactionParticipantQuery) Exists(exec boil.Executor) (bool, error) {
	var count int64

	queries.SetCount(q.Query)
	queries.SetLimit(q.Query, 1)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return false, errors.Wrap(err, "horizon: failed to check if history_transaction_participants exists")
	}

	return count > 0, nil
}

// HistoryTransactionParticipants retrieves all the records using an executor.
func HistoryTransactionParticipants(mods ...qm.QueryMod) historyTransactionParticipantQuery {
	mods = append(mods, qm.From("\"history_transaction_participants\""))
	return historyTransactionParticipantQuery{NewQuery(mods...)}
}

// FindHistoryTransactionParticipantG retrieves a single record by ID.
func FindHistoryTransactionParticipantG(iD int, selectCols ...string) (*HistoryTransactionParticipant, error) {
	return FindHistoryTransactionParticipant(boil.GetDB(), iD, selectCols...)
}

// FindHistoryTransactionParticipant retrieves a single record by ID with an executor.
// If selectCols is empty Find will return all columns.
func FindHistoryTransactionParticipant(exec boil.Executor, iD int, selectCols ...string) (*HistoryTransactionParticipant, error) {
	historyTransactionParticipantObj := &HistoryTransactionParticipant{}

	sel := "*"
	if len(selectCols) > 0 {
		sel = strings.Join(strmangle.IdentQuoteSlice(dialect.LQ, dialect.RQ, selectCols), ",")
	}
	query := fmt.Sprintf(
		"select %s from \"history_transaction_participants\" where \"id\"=$1", sel,
	)

	q := queries.Raw(query, iD)

	err := q.Bind(nil, exec, historyTransactionParticipantObj)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "horizon: unable to select from history_transaction_participants")
	}

	return historyTransactionParticipantObj, nil
}

// InsertG a single record. See Insert for whitelist behavior description.
func (o *HistoryTransactionParticipant) InsertG(columns boil.Columns) error {
	return o.Insert(boil.GetDB(), columns)
}

// Insert a single record using an executor.
// See boil.Columns.InsertColumnSet documentation to understand column list inference for inserts.
func (o *HistoryTransactionParticipant) Insert(exec boil.Executor, columns boil.Columns) error {
	if o == nil {
		return errors.New("horizon: no history_transaction_participants provided for insertion")
	}

	var err error

	if err := o.doBeforeInsertHooks(exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(historyTransactionParticipantColumnsWithDefault, o)

	key := makeCacheKey(columns, nzDefaults)
	historyTransactionParticipantInsertCacheMut.RLock()
	cache, cached := historyTransactionParticipantInsertCache[key]
	historyTransactionParticipantInsertCacheMut.RUnlock()

	if !cached {
		wl, returnColumns := columns.InsertColumnSet(
			historyTransactionParticipantColumns,
			historyTransactionParticipantColumnsWithDefault,
			historyTransactionParticipantColumnsWithoutDefault,
			nzDefaults,
		)

		cache.valueMapping, err = queries.BindMapping(historyTransactionParticipantType, historyTransactionParticipantMapping, wl)
		if err != nil {
			return err
		}
		cache.retMapping, err = queries.BindMapping(historyTransactionParticipantType, historyTransactionParticipantMapping, returnColumns)
		if err != nil {
			return err
		}
		if len(wl) != 0 {
			cache.query = fmt.Sprintf("INSERT INTO \"history_transaction_participants\" (\"%s\") %%sVALUES (%s)%%s", strings.Join(wl, "\",\""), strmangle.Placeholders(dialect.UseIndexPlaceholders, len(wl), 1, 1))
		} else {
			cache.query = "INSERT INTO \"history_transaction_participants\" %sDEFAULT VALUES%s"
		}

		var queryOutput, queryReturning string

		if len(cache.retMapping) != 0 {
			queryReturning = fmt.Sprintf(" RETURNING \"%s\"", strings.Join(returnColumns, "\",\""))
		}

		cache.query = fmt.Sprintf(cache.query, queryOutput, queryReturning)
	}

	value := reflect.Indirect(reflect.ValueOf(o))
	vals := queries.ValuesFromMapping(value, cache.valueMapping)

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, cache.query)
		fmt.Fprintln(boil.DebugWriter, vals)
	}

	if len(cache.retMapping) != 0 {
		err = exec.QueryRow(cache.query, vals...).Scan(queries.PtrsFromMapping(value, cache.retMapping)...)
	} else {
		_, err = exec.Exec(cache.query, vals...)
	}

	if err != nil {
		return errors.Wrap(err, "horizon: unable to insert into history_transaction_participants")
	}

	if !cached {
		historyTransactionParticipantInsertCacheMut.Lock()
		historyTransactionParticipantInsertCache[key] = cache
		historyTransactionParticipantInsertCacheMut.Unlock()
	}

	return o.doAfterInsertHooks(exec)
}

// UpdateG a single HistoryTransactionParticipant record using the global executor.
// See Update for more documentation.
func (o *HistoryTransactionParticipant) UpdateG(columns boil.Columns) (int64, error) {
	return o.Update(boil.GetDB(), columns)
}

// Update uses an executor to update the HistoryTransactionParticipant.
// See boil.Columns.UpdateColumnSet documentation to understand column list inference for updates.
// Update does not automatically update the record in case of default values. Use .Reload() to refresh the records.
func (o *HistoryTransactionParticipant) Update(exec boil.Executor, columns boil.Columns) (int64, error) {
	var err error
	if err = o.doBeforeUpdateHooks(exec); err != nil {
		return 0, err
	}
	key := makeCacheKey(columns, nil)
	historyTransactionParticipantUpdateCacheMut.RLock()
	cache, cached := historyTransactionParticipantUpdateCache[key]
	historyTransactionParticipantUpdateCacheMut.RUnlock()

	if !cached {
		wl := columns.UpdateColumnSet(
			historyTransactionParticipantColumns,
			historyTransactionParticipantPrimaryKeyColumns,
		)

		if !columns.IsWhitelist() {
			wl = strmangle.SetComplement(wl, []string{"created_at"})
		}
		if len(wl) == 0 {
			return 0, errors.New("horizon: unable to update history_transaction_participants, could not build whitelist")
		}

		cache.query = fmt.Sprintf("UPDATE \"history_transaction_participants\" SET %s WHERE %s",
			strmangle.SetParamNames("\"", "\"", 1, wl),
			strmangle.WhereClause("\"", "\"", len(wl)+1, historyTransactionParticipantPrimaryKeyColumns),
		)
		cache.valueMapping, err = queries.BindMapping(historyTransactionParticipantType, historyTransactionParticipantMapping, append(wl, historyTransactionParticipantPrimaryKeyColumns...))
		if err != nil {
			return 0, err
		}
	}

	values := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(o)), cache.valueMapping)

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, cache.query)
		fmt.Fprintln(boil.DebugWriter, values)
	}

	var result sql.Result
	result, err = exec.Exec(cache.query, values...)
	if err != nil {
		return 0, errors.Wrap(err, "horizon: unable to update history_transaction_participants row")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "horizon: failed to get rows affected by update for history_transaction_participants")
	}

	if !cached {
		historyTransactionParticipantUpdateCacheMut.Lock()
		historyTransactionParticipantUpdateCache[key] = cache
		historyTransactionParticipantUpdateCacheMut.Unlock()
	}

	return rowsAff, o.doAfterUpdateHooks(exec)
}

// UpdateAll updates all rows with the specified column values.
func (q historyTransactionParticipantQuery) UpdateAll(exec boil.Executor, cols M) (int64, error) {
	queries.SetUpdate(q.Query, cols)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "horizon: unable to update all for history_transaction_participants")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "horizon: unable to retrieve rows affected for history_transaction_participants")
	}

	return rowsAff, nil
}

// UpdateAllG updates all rows with the specified column values.
func (o HistoryTransactionParticipantSlice) UpdateAllG(cols M) (int64, error) {
	return o.UpdateAll(boil.GetDB(), cols)
}

// UpdateAll updates all rows with the specified column values, using an executor.
func (o HistoryTransactionParticipantSlice) UpdateAll(exec boil.Executor, cols M) (int64, error) {
	ln := int64(len(o))
	if ln == 0 {
		return 0, nil
	}

	if len(cols) == 0 {
		return 0, errors.New("horizon: update all requires at least one column argument")
	}

	colNames := make([]string, len(cols))
	args := make([]interface{}, len(cols))

	i := 0
	for name, value := range cols {
		colNames[i] = name
		args[i] = value
		i++
	}

	// Append all of the primary key values for each column
	for _, obj := range o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), historyTransactionParticipantPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := fmt.Sprintf("UPDATE \"history_transaction_participants\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, colNames),
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), len(colNames)+1, historyTransactionParticipantPrimaryKeyColumns, len(o)))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "horizon: unable to update all in historyTransactionParticipant slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "horizon: unable to retrieve rows affected all in update all historyTransactionParticipant")
	}
	return rowsAff, nil
}

// UpsertG attempts an insert, and does an update or ignore on conflict.
func (o *HistoryTransactionParticipant) UpsertG(updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	return o.Upsert(boil.GetDB(), updateOnConflict, conflictColumns, updateColumns, insertColumns)
}

// Upsert attempts an insert using an executor, and does an update or ignore on conflict.
// See boil.Columns documentation for how to properly use updateColumns and insertColumns.
func (o *HistoryTransactionParticipant) Upsert(exec boil.Executor, updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	if o == nil {
		return errors.New("horizon: no history_transaction_participants provided for upsert")
	}

	if err := o.doBeforeUpsertHooks(exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(historyTransactionParticipantColumnsWithDefault, o)

	// Build cache key in-line uglily - mysql vs psql problems
	buf := strmangle.GetBuffer()
	if updateOnConflict {
		buf.WriteByte('t')
	} else {
		buf.WriteByte('f')
	}
	buf.WriteByte('.')
	for _, c := range conflictColumns {
		buf.WriteString(c)
	}
	buf.WriteByte('.')
	buf.WriteString(strconv.Itoa(updateColumns.Kind))
	for _, c := range updateColumns.Cols {
		buf.WriteString(c)
	}
	buf.WriteByte('.')
	buf.WriteString(strconv.Itoa(insertColumns.Kind))
	for _, c := range insertColumns.Cols {
		buf.WriteString(c)
	}
	buf.WriteByte('.')
	for _, c := range nzDefaults {
		buf.WriteString(c)
	}
	key := buf.String()
	strmangle.PutBuffer(buf)

	historyTransactionParticipantUpsertCacheMut.RLock()
	cache, cached := historyTransactionParticipantUpsertCache[key]
	historyTransactionParticipantUpsertCacheMut.RUnlock()

	var err error

	if !cached {
		insert, ret := insertColumns.InsertColumnSet(
			historyTransactionParticipantColumns,
			historyTransactionParticipantColumnsWithDefault,
			historyTransactionParticipantColumnsWithoutDefault,
			nzDefaults,
		)
		update := updateColumns.UpdateColumnSet(
			historyTransactionParticipantColumns,
			historyTransactionParticipantPrimaryKeyColumns,
		)

		if len(update) == 0 {
			return errors.New("horizon: unable to upsert history_transaction_participants, could not build update column list")
		}

		conflict := conflictColumns
		if len(conflict) == 0 {
			conflict = make([]string, len(historyTransactionParticipantPrimaryKeyColumns))
			copy(conflict, historyTransactionParticipantPrimaryKeyColumns)
		}
		cache.query = buildUpsertQueryPostgres(dialect, "\"history_transaction_participants\"", updateOnConflict, ret, update, conflict, insert)

		cache.valueMapping, err = queries.BindMapping(historyTransactionParticipantType, historyTransactionParticipantMapping, insert)
		if err != nil {
			return err
		}
		if len(ret) != 0 {
			cache.retMapping, err = queries.BindMapping(historyTransactionParticipantType, historyTransactionParticipantMapping, ret)
			if err != nil {
				return err
			}
		}
	}

	value := reflect.Indirect(reflect.ValueOf(o))
	vals := queries.ValuesFromMapping(value, cache.valueMapping)
	var returns []interface{}
	if len(cache.retMapping) != 0 {
		returns = queries.PtrsFromMapping(value, cache.retMapping)
	}

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, cache.query)
		fmt.Fprintln(boil.DebugWriter, vals)
	}

	if len(cache.retMapping) != 0 {
		err = exec.QueryRow(cache.query, vals...).Scan(returns...)
		if err == sql.ErrNoRows {
			err = nil // Postgres doesn't return anything when there's no update
		}
	} else {
		_, err = exec.Exec(cache.query, vals...)
	}
	if err != nil {
		return errors.Wrap(err, "horizon: unable to upsert history_transaction_participants")
	}

	if !cached {
		historyTransactionParticipantUpsertCacheMut.Lock()
		historyTransactionParticipantUpsertCache[key] = cache
		historyTransactionParticipantUpsertCacheMut.Unlock()
	}

	return o.doAfterUpsertHooks(exec)
}

// DeleteG deletes a single HistoryTransactionParticipant record.
// DeleteG will match against the primary key column to find the record to delete.
func (o *HistoryTransactionParticipant) DeleteG() (int64, error) {
	return o.Delete(boil.GetDB())
}

// Delete deletes a single HistoryTransactionParticipant record with an executor.
// Delete will match against the primary key column to find the record to delete.
func (o *HistoryTransactionParticipant) Delete(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("horizon: no HistoryTransactionParticipant provided for delete")
	}

	if err := o.doBeforeDeleteHooks(exec); err != nil {
		return 0, err
	}

	args := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(o)), historyTransactionParticipantPrimaryKeyMapping)
	sql := "DELETE FROM \"history_transaction_participants\" WHERE \"id\"=$1"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "horizon: unable to delete from history_transaction_participants")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "horizon: failed to get rows affected by delete for history_transaction_participants")
	}

	if err := o.doAfterDeleteHooks(exec); err != nil {
		return 0, err
	}

	return rowsAff, nil
}

// DeleteAll deletes all matching rows.
func (q historyTransactionParticipantQuery) DeleteAll(exec boil.Executor) (int64, error) {
	if q.Query == nil {
		return 0, errors.New("horizon: no historyTransactionParticipantQuery provided for delete all")
	}

	queries.SetDelete(q.Query)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "horizon: unable to delete all from history_transaction_participants")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "horizon: failed to get rows affected by deleteall for history_transaction_participants")
	}

	return rowsAff, nil
}

// DeleteAllG deletes all rows in the slice.
func (o HistoryTransactionParticipantSlice) DeleteAllG() (int64, error) {
	return o.DeleteAll(boil.GetDB())
}

// DeleteAll deletes all rows in the slice, using an executor.
func (o HistoryTransactionParticipantSlice) DeleteAll(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("horizon: no HistoryTransactionParticipant slice provided for delete all")
	}

	if len(o) == 0 {
		return 0, nil
	}

	if len(historyTransactionParticipantBeforeDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doBeforeDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	var args []interface{}
	for _, obj := range o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), historyTransactionParticipantPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "DELETE FROM \"history_transaction_participants\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, historyTransactionParticipantPrimaryKeyColumns, len(o))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "horizon: unable to delete all from historyTransactionParticipant slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "horizon: failed to get rows affected by deleteall for history_transaction_participants")
	}

	if len(historyTransactionParticipantAfterDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	return rowsAff, nil
}

// ReloadG refetches the object from the database using the primary keys.
func (o *HistoryTransactionParticipant) ReloadG() error {
	if o == nil {
		return errors.New("horizon: no HistoryTransactionParticipant provided for reload")
	}

	return o.Reload(boil.GetDB())
}

// Reload refetches the object from the database
// using the primary keys with an executor.
func (o *HistoryTransactionParticipant) Reload(exec boil.Executor) error {
	ret, err := FindHistoryTransactionParticipant(exec, o.ID)
	if err != nil {
		return err
	}

	*o = *ret
	return nil
}

// ReloadAllG refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *HistoryTransactionParticipantSlice) ReloadAllG() error {
	if o == nil {
		return errors.New("horizon: empty HistoryTransactionParticipantSlice provided for reload all")
	}

	return o.ReloadAll(boil.GetDB())
}

// ReloadAll refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *HistoryTransactionParticipantSlice) ReloadAll(exec boil.Executor) error {
	if o == nil || len(*o) == 0 {
		return nil
	}

	slice := HistoryTransactionParticipantSlice{}
	var args []interface{}
	for _, obj := range *o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), historyTransactionParticipantPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "SELECT \"history_transaction_participants\".* FROM \"history_transaction_participants\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, historyTransactionParticipantPrimaryKeyColumns, len(*o))

	q := queries.Raw(sql, args...)

	err := q.Bind(nil, exec, &slice)
	if err != nil {
		return errors.Wrap(err, "horizon: unable to reload all in HistoryTransactionParticipantSlice")
	}

	*o = slice

	return nil
}

// HistoryTransactionParticipantExistsG checks if the HistoryTransactionParticipant row exists.
func HistoryTransactionParticipantExistsG(iD int) (bool, error) {
	return HistoryTransactionParticipantExists(boil.GetDB(), iD)
}

// HistoryTransactionParticipantExists checks if the HistoryTransactionParticipant row exists.
func HistoryTransactionParticipantExists(exec boil.Executor, iD int) (bool, error) {
	var exists bool
	sql := "select exists(select 1 from \"history_transaction_participants\" where \"id\"=$1 limit 1)"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, iD)
	}

	row := exec.QueryRow(sql, iD)

	err := row.Scan(&exists)
	if err != nil {
		return false, errors.Wrap(err, "horizon: unable to check if history_transaction_participants exists")
	}

	return exists, nil
}
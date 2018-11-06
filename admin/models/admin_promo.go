// Code generated by SQLBoiler (https://github.com/volatiletech/sqlboiler). DO NOT EDIT.
// This file is meant to be re-generated in place and/or deleted at any time.

package models

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

// AdminPromo is an object representing the database table.
type AdminPromo struct {
	ID         int       `boil:"id" json:"id" toml:"id" yaml:"id"`
	Name       string    `boil:"name" json:"name" toml:"name" yaml:"name"`
	Title      string    `boil:"title" json:"title" toml:"title" yaml:"title"`
	PromoText  string    `boil:"promo_text" json:"promo_text" toml:"promo_text" yaml:"promo_text"`
	PromoType  string    `boil:"promo_type" json:"promo_type" toml:"promo_type" yaml:"promo_type"`
	ImageType  string    `boil:"image_type" json:"image_type" toml:"image_type" yaml:"image_type"`
	Buttons    string    `boil:"buttons" json:"buttons" toml:"buttons" yaml:"buttons"`
	Active     bool      `boil:"active" json:"active" toml:"active" yaml:"active"`
	OrderIndex int       `boil:"order_index" json:"order_index" toml:"order_index" yaml:"order_index"`
	CreatedAt  time.Time `boil:"created_at" json:"created_at" toml:"created_at" yaml:"created_at"`
	UpdatedAt  time.Time `boil:"updated_at" json:"updated_at" toml:"updated_at" yaml:"updated_at"`
	UpdatedBy  string    `boil:"updated_by" json:"updated_by" toml:"updated_by" yaml:"updated_by"`

	R *adminPromoR `boil:"-" json:"-" toml:"-" yaml:"-"`
	L adminPromoL  `boil:"-" json:"-" toml:"-" yaml:"-"`
}

var AdminPromoColumns = struct {
	ID         string
	Name       string
	Title      string
	PromoText  string
	PromoType  string
	ImageType  string
	Buttons    string
	Active     string
	OrderIndex string
	CreatedAt  string
	UpdatedAt  string
	UpdatedBy  string
}{
	ID:         "id",
	Name:       "name",
	Title:      "title",
	PromoText:  "promo_text",
	PromoType:  "promo_type",
	ImageType:  "image_type",
	Buttons:    "buttons",
	Active:     "active",
	OrderIndex: "order_index",
	CreatedAt:  "created_at",
	UpdatedAt:  "updated_at",
	UpdatedBy:  "updated_by",
}

// AdminPromoRels is where relationship names are stored.
var AdminPromoRels = struct {
}{}

// adminPromoR is where relationships are stored.
type adminPromoR struct {
}

// NewStruct creates a new relationship struct
func (*adminPromoR) NewStruct() *adminPromoR {
	return &adminPromoR{}
}

// adminPromoL is where Load methods for each relationship are stored.
type adminPromoL struct{}

var (
	adminPromoColumns               = []string{"id", "name", "title", "promo_text", "promo_type", "image_type", "buttons", "active", "order_index", "created_at", "updated_at", "updated_by"}
	adminPromoColumnsWithoutDefault = []string{"name", "title", "promo_text", "promo_type", "image_type", "buttons", "order_index", "updated_by"}
	adminPromoColumnsWithDefault    = []string{"id", "active", "created_at", "updated_at"}
	adminPromoPrimaryKeyColumns     = []string{"id"}
)

type (
	// AdminPromoSlice is an alias for a slice of pointers to AdminPromo.
	// This should generally be used opposed to []AdminPromo.
	AdminPromoSlice []*AdminPromo
	// AdminPromoHook is the signature for custom AdminPromo hook methods
	AdminPromoHook func(boil.Executor, *AdminPromo) error

	adminPromoQuery struct {
		*queries.Query
	}
)

// Cache for insert, update and upsert
var (
	adminPromoType                 = reflect.TypeOf(&AdminPromo{})
	adminPromoMapping              = queries.MakeStructMapping(adminPromoType)
	adminPromoPrimaryKeyMapping, _ = queries.BindMapping(adminPromoType, adminPromoMapping, adminPromoPrimaryKeyColumns)
	adminPromoInsertCacheMut       sync.RWMutex
	adminPromoInsertCache          = make(map[string]insertCache)
	adminPromoUpdateCacheMut       sync.RWMutex
	adminPromoUpdateCache          = make(map[string]updateCache)
	adminPromoUpsertCacheMut       sync.RWMutex
	adminPromoUpsertCache          = make(map[string]insertCache)
)

var (
	// Force time package dependency for automated UpdatedAt/CreatedAt.
	_ = time.Second
)

var adminPromoBeforeInsertHooks []AdminPromoHook
var adminPromoBeforeUpdateHooks []AdminPromoHook
var adminPromoBeforeDeleteHooks []AdminPromoHook
var adminPromoBeforeUpsertHooks []AdminPromoHook

var adminPromoAfterInsertHooks []AdminPromoHook
var adminPromoAfterSelectHooks []AdminPromoHook
var adminPromoAfterUpdateHooks []AdminPromoHook
var adminPromoAfterDeleteHooks []AdminPromoHook
var adminPromoAfterUpsertHooks []AdminPromoHook

// doBeforeInsertHooks executes all "before insert" hooks.
func (o *AdminPromo) doBeforeInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoBeforeInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpdateHooks executes all "before Update" hooks.
func (o *AdminPromo) doBeforeUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoBeforeUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeDeleteHooks executes all "before Delete" hooks.
func (o *AdminPromo) doBeforeDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoBeforeDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpsertHooks executes all "before Upsert" hooks.
func (o *AdminPromo) doBeforeUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoBeforeUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterInsertHooks executes all "after Insert" hooks.
func (o *AdminPromo) doAfterInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoAfterInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterSelectHooks executes all "after Select" hooks.
func (o *AdminPromo) doAfterSelectHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoAfterSelectHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpdateHooks executes all "after Update" hooks.
func (o *AdminPromo) doAfterUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoAfterUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterDeleteHooks executes all "after Delete" hooks.
func (o *AdminPromo) doAfterDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoAfterDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpsertHooks executes all "after Upsert" hooks.
func (o *AdminPromo) doAfterUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range adminPromoAfterUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// AddAdminPromoHook registers your hook function for all future operations.
func AddAdminPromoHook(hookPoint boil.HookPoint, adminPromoHook AdminPromoHook) {
	switch hookPoint {
	case boil.BeforeInsertHook:
		adminPromoBeforeInsertHooks = append(adminPromoBeforeInsertHooks, adminPromoHook)
	case boil.BeforeUpdateHook:
		adminPromoBeforeUpdateHooks = append(adminPromoBeforeUpdateHooks, adminPromoHook)
	case boil.BeforeDeleteHook:
		adminPromoBeforeDeleteHooks = append(adminPromoBeforeDeleteHooks, adminPromoHook)
	case boil.BeforeUpsertHook:
		adminPromoBeforeUpsertHooks = append(adminPromoBeforeUpsertHooks, adminPromoHook)
	case boil.AfterInsertHook:
		adminPromoAfterInsertHooks = append(adminPromoAfterInsertHooks, adminPromoHook)
	case boil.AfterSelectHook:
		adminPromoAfterSelectHooks = append(adminPromoAfterSelectHooks, adminPromoHook)
	case boil.AfterUpdateHook:
		adminPromoAfterUpdateHooks = append(adminPromoAfterUpdateHooks, adminPromoHook)
	case boil.AfterDeleteHook:
		adminPromoAfterDeleteHooks = append(adminPromoAfterDeleteHooks, adminPromoHook)
	case boil.AfterUpsertHook:
		adminPromoAfterUpsertHooks = append(adminPromoAfterUpsertHooks, adminPromoHook)
	}
}

// OneG returns a single adminPromo record from the query using the global executor.
func (q adminPromoQuery) OneG() (*AdminPromo, error) {
	return q.One(boil.GetDB())
}

// One returns a single adminPromo record from the query.
func (q adminPromoQuery) One(exec boil.Executor) (*AdminPromo, error) {
	o := &AdminPromo{}

	queries.SetLimit(q.Query, 1)

	err := q.Bind(nil, exec, o)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: failed to execute a one query for admin_promo")
	}

	if err := o.doAfterSelectHooks(exec); err != nil {
		return o, err
	}

	return o, nil
}

// AllG returns all AdminPromo records from the query using the global executor.
func (q adminPromoQuery) AllG() (AdminPromoSlice, error) {
	return q.All(boil.GetDB())
}

// All returns all AdminPromo records from the query.
func (q adminPromoQuery) All(exec boil.Executor) (AdminPromoSlice, error) {
	var o []*AdminPromo

	err := q.Bind(nil, exec, &o)
	if err != nil {
		return nil, errors.Wrap(err, "models: failed to assign all query results to AdminPromo slice")
	}

	if len(adminPromoAfterSelectHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterSelectHooks(exec); err != nil {
				return o, err
			}
		}
	}

	return o, nil
}

// CountG returns the count of all AdminPromo records in the query, and panics on error.
func (q adminPromoQuery) CountG() (int64, error) {
	return q.Count(boil.GetDB())
}

// Count returns the count of all AdminPromo records in the query.
func (q adminPromoQuery) Count(exec boil.Executor) (int64, error) {
	var count int64

	queries.SetSelect(q.Query, nil)
	queries.SetCount(q.Query)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to count admin_promo rows")
	}

	return count, nil
}

// ExistsG checks if the row exists in the table, and panics on error.
func (q adminPromoQuery) ExistsG() (bool, error) {
	return q.Exists(boil.GetDB())
}

// Exists checks if the row exists in the table.
func (q adminPromoQuery) Exists(exec boil.Executor) (bool, error) {
	var count int64

	queries.SetCount(q.Query)
	queries.SetLimit(q.Query, 1)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return false, errors.Wrap(err, "models: failed to check if admin_promo exists")
	}

	return count > 0, nil
}

// AdminPromos retrieves all the records using an executor.
func AdminPromos(mods ...qm.QueryMod) adminPromoQuery {
	mods = append(mods, qm.From("\"admin_promo\""))
	return adminPromoQuery{NewQuery(mods...)}
}

// FindAdminPromoG retrieves a single record by ID.
func FindAdminPromoG(iD int, selectCols ...string) (*AdminPromo, error) {
	return FindAdminPromo(boil.GetDB(), iD, selectCols...)
}

// FindAdminPromo retrieves a single record by ID with an executor.
// If selectCols is empty Find will return all columns.
func FindAdminPromo(exec boil.Executor, iD int, selectCols ...string) (*AdminPromo, error) {
	adminPromoObj := &AdminPromo{}

	sel := "*"
	if len(selectCols) > 0 {
		sel = strings.Join(strmangle.IdentQuoteSlice(dialect.LQ, dialect.RQ, selectCols), ",")
	}
	query := fmt.Sprintf(
		"select %s from \"admin_promo\" where \"id\"=$1", sel,
	)

	q := queries.Raw(query, iD)

	err := q.Bind(nil, exec, adminPromoObj)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: unable to select from admin_promo")
	}

	return adminPromoObj, nil
}

// InsertG a single record. See Insert for whitelist behavior description.
func (o *AdminPromo) InsertG(columns boil.Columns) error {
	return o.Insert(boil.GetDB(), columns)
}

// Insert a single record using an executor.
// See boil.Columns.InsertColumnSet documentation to understand column list inference for inserts.
func (o *AdminPromo) Insert(exec boil.Executor, columns boil.Columns) error {
	if o == nil {
		return errors.New("models: no admin_promo provided for insertion")
	}

	var err error
	currTime := time.Now().In(boil.GetLocation())

	if o.CreatedAt.IsZero() {
		o.CreatedAt = currTime
	}
	if o.UpdatedAt.IsZero() {
		o.UpdatedAt = currTime
	}

	if err := o.doBeforeInsertHooks(exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(adminPromoColumnsWithDefault, o)

	key := makeCacheKey(columns, nzDefaults)
	adminPromoInsertCacheMut.RLock()
	cache, cached := adminPromoInsertCache[key]
	adminPromoInsertCacheMut.RUnlock()

	if !cached {
		wl, returnColumns := columns.InsertColumnSet(
			adminPromoColumns,
			adminPromoColumnsWithDefault,
			adminPromoColumnsWithoutDefault,
			nzDefaults,
		)

		cache.valueMapping, err = queries.BindMapping(adminPromoType, adminPromoMapping, wl)
		if err != nil {
			return err
		}
		cache.retMapping, err = queries.BindMapping(adminPromoType, adminPromoMapping, returnColumns)
		if err != nil {
			return err
		}
		if len(wl) != 0 {
			cache.query = fmt.Sprintf("INSERT INTO \"admin_promo\" (\"%s\") %%sVALUES (%s)%%s", strings.Join(wl, "\",\""), strmangle.Placeholders(dialect.UseIndexPlaceholders, len(wl), 1, 1))
		} else {
			cache.query = "INSERT INTO \"admin_promo\" %sDEFAULT VALUES%s"
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
		return errors.Wrap(err, "models: unable to insert into admin_promo")
	}

	if !cached {
		adminPromoInsertCacheMut.Lock()
		adminPromoInsertCache[key] = cache
		adminPromoInsertCacheMut.Unlock()
	}

	return o.doAfterInsertHooks(exec)
}

// UpdateG a single AdminPromo record using the global executor.
// See Update for more documentation.
func (o *AdminPromo) UpdateG(columns boil.Columns) (int64, error) {
	return o.Update(boil.GetDB(), columns)
}

// Update uses an executor to update the AdminPromo.
// See boil.Columns.UpdateColumnSet documentation to understand column list inference for updates.
// Update does not automatically update the record in case of default values. Use .Reload() to refresh the records.
func (o *AdminPromo) Update(exec boil.Executor, columns boil.Columns) (int64, error) {
	currTime := time.Now().In(boil.GetLocation())

	o.UpdatedAt = currTime

	var err error
	if err = o.doBeforeUpdateHooks(exec); err != nil {
		return 0, err
	}
	key := makeCacheKey(columns, nil)
	adminPromoUpdateCacheMut.RLock()
	cache, cached := adminPromoUpdateCache[key]
	adminPromoUpdateCacheMut.RUnlock()

	if !cached {
		wl := columns.UpdateColumnSet(
			adminPromoColumns,
			adminPromoPrimaryKeyColumns,
		)

		if !columns.IsWhitelist() {
			wl = strmangle.SetComplement(wl, []string{"created_at"})
		}
		if len(wl) == 0 {
			return 0, errors.New("models: unable to update admin_promo, could not build whitelist")
		}

		cache.query = fmt.Sprintf("UPDATE \"admin_promo\" SET %s WHERE %s",
			strmangle.SetParamNames("\"", "\"", 1, wl),
			strmangle.WhereClause("\"", "\"", len(wl)+1, adminPromoPrimaryKeyColumns),
		)
		cache.valueMapping, err = queries.BindMapping(adminPromoType, adminPromoMapping, append(wl, adminPromoPrimaryKeyColumns...))
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
		return 0, errors.Wrap(err, "models: unable to update admin_promo row")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by update for admin_promo")
	}

	if !cached {
		adminPromoUpdateCacheMut.Lock()
		adminPromoUpdateCache[key] = cache
		adminPromoUpdateCacheMut.Unlock()
	}

	return rowsAff, o.doAfterUpdateHooks(exec)
}

// UpdateAll updates all rows with the specified column values.
func (q adminPromoQuery) UpdateAll(exec boil.Executor, cols M) (int64, error) {
	queries.SetUpdate(q.Query, cols)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all for admin_promo")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected for admin_promo")
	}

	return rowsAff, nil
}

// UpdateAllG updates all rows with the specified column values.
func (o AdminPromoSlice) UpdateAllG(cols M) (int64, error) {
	return o.UpdateAll(boil.GetDB(), cols)
}

// UpdateAll updates all rows with the specified column values, using an executor.
func (o AdminPromoSlice) UpdateAll(exec boil.Executor, cols M) (int64, error) {
	ln := int64(len(o))
	if ln == 0 {
		return 0, nil
	}

	if len(cols) == 0 {
		return 0, errors.New("models: update all requires at least one column argument")
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
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), adminPromoPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := fmt.Sprintf("UPDATE \"admin_promo\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, colNames),
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), len(colNames)+1, adminPromoPrimaryKeyColumns, len(o)))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all in adminPromo slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected all in update all adminPromo")
	}
	return rowsAff, nil
}

// UpsertG attempts an insert, and does an update or ignore on conflict.
func (o *AdminPromo) UpsertG(updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	return o.Upsert(boil.GetDB(), updateOnConflict, conflictColumns, updateColumns, insertColumns)
}

// Upsert attempts an insert using an executor, and does an update or ignore on conflict.
// See boil.Columns documentation for how to properly use updateColumns and insertColumns.
func (o *AdminPromo) Upsert(exec boil.Executor, updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	if o == nil {
		return errors.New("models: no admin_promo provided for upsert")
	}
	currTime := time.Now().In(boil.GetLocation())

	if o.CreatedAt.IsZero() {
		o.CreatedAt = currTime
	}
	o.UpdatedAt = currTime

	if err := o.doBeforeUpsertHooks(exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(adminPromoColumnsWithDefault, o)

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

	adminPromoUpsertCacheMut.RLock()
	cache, cached := adminPromoUpsertCache[key]
	adminPromoUpsertCacheMut.RUnlock()

	var err error

	if !cached {
		insert, ret := insertColumns.InsertColumnSet(
			adminPromoColumns,
			adminPromoColumnsWithDefault,
			adminPromoColumnsWithoutDefault,
			nzDefaults,
		)
		update := updateColumns.UpdateColumnSet(
			adminPromoColumns,
			adminPromoPrimaryKeyColumns,
		)

		if len(update) == 0 {
			return errors.New("models: unable to upsert admin_promo, could not build update column list")
		}

		conflict := conflictColumns
		if len(conflict) == 0 {
			conflict = make([]string, len(adminPromoPrimaryKeyColumns))
			copy(conflict, adminPromoPrimaryKeyColumns)
		}
		cache.query = buildUpsertQueryPostgres(dialect, "\"admin_promo\"", updateOnConflict, ret, update, conflict, insert)

		cache.valueMapping, err = queries.BindMapping(adminPromoType, adminPromoMapping, insert)
		if err != nil {
			return err
		}
		if len(ret) != 0 {
			cache.retMapping, err = queries.BindMapping(adminPromoType, adminPromoMapping, ret)
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
		return errors.Wrap(err, "models: unable to upsert admin_promo")
	}

	if !cached {
		adminPromoUpsertCacheMut.Lock()
		adminPromoUpsertCache[key] = cache
		adminPromoUpsertCacheMut.Unlock()
	}

	return o.doAfterUpsertHooks(exec)
}

// DeleteG deletes a single AdminPromo record.
// DeleteG will match against the primary key column to find the record to delete.
func (o *AdminPromo) DeleteG() (int64, error) {
	return o.Delete(boil.GetDB())
}

// Delete deletes a single AdminPromo record with an executor.
// Delete will match against the primary key column to find the record to delete.
func (o *AdminPromo) Delete(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no AdminPromo provided for delete")
	}

	if err := o.doBeforeDeleteHooks(exec); err != nil {
		return 0, err
	}

	args := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(o)), adminPromoPrimaryKeyMapping)
	sql := "DELETE FROM \"admin_promo\" WHERE \"id\"=$1"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete from admin_promo")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by delete for admin_promo")
	}

	if err := o.doAfterDeleteHooks(exec); err != nil {
		return 0, err
	}

	return rowsAff, nil
}

// DeleteAll deletes all matching rows.
func (q adminPromoQuery) DeleteAll(exec boil.Executor) (int64, error) {
	if q.Query == nil {
		return 0, errors.New("models: no adminPromoQuery provided for delete all")
	}

	queries.SetDelete(q.Query)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from admin_promo")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for admin_promo")
	}

	return rowsAff, nil
}

// DeleteAllG deletes all rows in the slice.
func (o AdminPromoSlice) DeleteAllG() (int64, error) {
	return o.DeleteAll(boil.GetDB())
}

// DeleteAll deletes all rows in the slice, using an executor.
func (o AdminPromoSlice) DeleteAll(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no AdminPromo slice provided for delete all")
	}

	if len(o) == 0 {
		return 0, nil
	}

	if len(adminPromoBeforeDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doBeforeDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	var args []interface{}
	for _, obj := range o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), adminPromoPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "DELETE FROM \"admin_promo\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, adminPromoPrimaryKeyColumns, len(o))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from adminPromo slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for admin_promo")
	}

	if len(adminPromoAfterDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	return rowsAff, nil
}

// ReloadG refetches the object from the database using the primary keys.
func (o *AdminPromo) ReloadG() error {
	if o == nil {
		return errors.New("models: no AdminPromo provided for reload")
	}

	return o.Reload(boil.GetDB())
}

// Reload refetches the object from the database
// using the primary keys with an executor.
func (o *AdminPromo) Reload(exec boil.Executor) error {
	ret, err := FindAdminPromo(exec, o.ID)
	if err != nil {
		return err
	}

	*o = *ret
	return nil
}

// ReloadAllG refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *AdminPromoSlice) ReloadAllG() error {
	if o == nil {
		return errors.New("models: empty AdminPromoSlice provided for reload all")
	}

	return o.ReloadAll(boil.GetDB())
}

// ReloadAll refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *AdminPromoSlice) ReloadAll(exec boil.Executor) error {
	if o == nil || len(*o) == 0 {
		return nil
	}

	slice := AdminPromoSlice{}
	var args []interface{}
	for _, obj := range *o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), adminPromoPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "SELECT \"admin_promo\".* FROM \"admin_promo\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, adminPromoPrimaryKeyColumns, len(*o))

	q := queries.Raw(sql, args...)

	err := q.Bind(nil, exec, &slice)
	if err != nil {
		return errors.Wrap(err, "models: unable to reload all in AdminPromoSlice")
	}

	*o = slice

	return nil
}

// AdminPromoExistsG checks if the AdminPromo row exists.
func AdminPromoExistsG(iD int) (bool, error) {
	return AdminPromoExists(boil.GetDB(), iD)
}

// AdminPromoExists checks if the AdminPromo row exists.
func AdminPromoExists(exec boil.Executor, iD int) (bool, error) {
	var exists bool
	sql := "select exists(select 1 from \"admin_promo\" where \"id\"=$1 limit 1)"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, iD)
	}

	row := exec.QueryRow(sql, iD)

	err := row.Scan(&exists)
	if err != nil {
		return false, errors.Wrap(err, "models: unable to check if admin_promo exists")
	}

	return exists, nil
}
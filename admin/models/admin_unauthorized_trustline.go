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

// AdminUnauthorizedTrustline is an object representing the database table.
type AdminUnauthorizedTrustline struct {
	ID                int       `boil:"id" json:"id" toml:"id" yaml:"id"`
	IssuerPublicKeyID string    `boil:"issuer_public_key_id" json:"issuer_public_key_id" toml:"issuer_public_key_id" yaml:"issuer_public_key_id"`
	TrustorPublicKey  string    `boil:"trustor_public_key" json:"trustor_public_key" toml:"trustor_public_key" yaml:"trustor_public_key"`
	AssetCode         string    `boil:"asset_code" json:"asset_code" toml:"asset_code" yaml:"asset_code"`
	Status            string    `boil:"status" json:"status" toml:"status" yaml:"status"`
	Reason            string    `boil:"reason" json:"reason" toml:"reason" yaml:"reason"`
	CreatedAt         time.Time `boil:"created_at" json:"created_at" toml:"created_at" yaml:"created_at"`
	UpdatedAt         time.Time `boil:"updated_at" json:"updated_at" toml:"updated_at" yaml:"updated_at"`
	UpdatedBy         string    `boil:"updated_by" json:"updated_by" toml:"updated_by" yaml:"updated_by"`

	R *adminUnauthorizedTrustlineR `boil:"-" json:"-" toml:"-" yaml:"-"`
	L adminUnauthorizedTrustlineL  `boil:"-" json:"-" toml:"-" yaml:"-"`
}

var AdminUnauthorizedTrustlineColumns = struct {
	ID                string
	IssuerPublicKeyID string
	TrustorPublicKey  string
	AssetCode         string
	Status            string
	Reason            string
	CreatedAt         string
	UpdatedAt         string
	UpdatedBy         string
}{
	ID:                "id",
	IssuerPublicKeyID: "issuer_public_key_id",
	TrustorPublicKey:  "trustor_public_key",
	AssetCode:         "asset_code",
	Status:            "status",
	Reason:            "reason",
	CreatedAt:         "created_at",
	UpdatedAt:         "updated_at",
	UpdatedBy:         "updated_by",
}

// AdminUnauthorizedTrustlineRels is where relationship names are stored.
var AdminUnauthorizedTrustlineRels = struct {
	IssuerPublicKey string
}{
	IssuerPublicKey: "IssuerPublicKey",
}

// adminUnauthorizedTrustlineR is where relationships are stored.
type adminUnauthorizedTrustlineR struct {
	IssuerPublicKey *AdminStellarAccount
}

// NewStruct creates a new relationship struct
func (*adminUnauthorizedTrustlineR) NewStruct() *adminUnauthorizedTrustlineR {
	return &adminUnauthorizedTrustlineR{}
}

// adminUnauthorizedTrustlineL is where Load methods for each relationship are stored.
type adminUnauthorizedTrustlineL struct{}

var (
	adminUnauthorizedTrustlineColumns               = []string{"id", "issuer_public_key_id", "trustor_public_key", "asset_code", "status", "reason", "created_at", "updated_at", "updated_by"}
	adminUnauthorizedTrustlineColumnsWithoutDefault = []string{"issuer_public_key_id", "trustor_public_key", "asset_code", "status", "reason", "updated_by"}
	adminUnauthorizedTrustlineColumnsWithDefault    = []string{"id", "created_at", "updated_at"}
	adminUnauthorizedTrustlinePrimaryKeyColumns     = []string{"id"}
)

type (
	// AdminUnauthorizedTrustlineSlice is an alias for a slice of pointers to AdminUnauthorizedTrustline.
	// This should generally be used opposed to []AdminUnauthorizedTrustline.
	AdminUnauthorizedTrustlineSlice []*AdminUnauthorizedTrustline
	// AdminUnauthorizedTrustlineHook is the signature for custom AdminUnauthorizedTrustline hook methods
	AdminUnauthorizedTrustlineHook func(boil.Executor, *AdminUnauthorizedTrustline) error

	adminUnauthorizedTrustlineQuery struct {
		*queries.Query
	}
)

// Cache for insert, update and upsert
var (
	adminUnauthorizedTrustlineType                 = reflect.TypeOf(&AdminUnauthorizedTrustline{})
	adminUnauthorizedTrustlineMapping              = queries.MakeStructMapping(adminUnauthorizedTrustlineType)
	adminUnauthorizedTrustlinePrimaryKeyMapping, _ = queries.BindMapping(adminUnauthorizedTrustlineType, adminUnauthorizedTrustlineMapping, adminUnauthorizedTrustlinePrimaryKeyColumns)
	adminUnauthorizedTrustlineInsertCacheMut       sync.RWMutex
	adminUnauthorizedTrustlineInsertCache          = make(map[string]insertCache)
	adminUnauthorizedTrustlineUpdateCacheMut       sync.RWMutex
	adminUnauthorizedTrustlineUpdateCache          = make(map[string]updateCache)
	adminUnauthorizedTrustlineUpsertCacheMut       sync.RWMutex
	adminUnauthorizedTrustlineUpsertCache          = make(map[string]insertCache)
)

var (
	// Force time package dependency for automated UpdatedAt/CreatedAt.
	_ = time.Second
)

var adminUnauthorizedTrustlineBeforeInsertHooks []AdminUnauthorizedTrustlineHook
var adminUnauthorizedTrustlineBeforeUpdateHooks []AdminUnauthorizedTrustlineHook
var adminUnauthorizedTrustlineBeforeDeleteHooks []AdminUnauthorizedTrustlineHook
var adminUnauthorizedTrustlineBeforeUpsertHooks []AdminUnauthorizedTrustlineHook

var adminUnauthorizedTrustlineAfterInsertHooks []AdminUnauthorizedTrustlineHook
var adminUnauthorizedTrustlineAfterSelectHooks []AdminUnauthorizedTrustlineHook
var adminUnauthorizedTrustlineAfterUpdateHooks []AdminUnauthorizedTrustlineHook
var adminUnauthorizedTrustlineAfterDeleteHooks []AdminUnauthorizedTrustlineHook
var adminUnauthorizedTrustlineAfterUpsertHooks []AdminUnauthorizedTrustlineHook

// doBeforeInsertHooks executes all "before insert" hooks.
func (o *AdminUnauthorizedTrustline) doBeforeInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineBeforeInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpdateHooks executes all "before Update" hooks.
func (o *AdminUnauthorizedTrustline) doBeforeUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineBeforeUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeDeleteHooks executes all "before Delete" hooks.
func (o *AdminUnauthorizedTrustline) doBeforeDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineBeforeDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpsertHooks executes all "before Upsert" hooks.
func (o *AdminUnauthorizedTrustline) doBeforeUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineBeforeUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterInsertHooks executes all "after Insert" hooks.
func (o *AdminUnauthorizedTrustline) doAfterInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineAfterInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterSelectHooks executes all "after Select" hooks.
func (o *AdminUnauthorizedTrustline) doAfterSelectHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineAfterSelectHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpdateHooks executes all "after Update" hooks.
func (o *AdminUnauthorizedTrustline) doAfterUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineAfterUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterDeleteHooks executes all "after Delete" hooks.
func (o *AdminUnauthorizedTrustline) doAfterDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineAfterDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpsertHooks executes all "after Upsert" hooks.
func (o *AdminUnauthorizedTrustline) doAfterUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range adminUnauthorizedTrustlineAfterUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// AddAdminUnauthorizedTrustlineHook registers your hook function for all future operations.
func AddAdminUnauthorizedTrustlineHook(hookPoint boil.HookPoint, adminUnauthorizedTrustlineHook AdminUnauthorizedTrustlineHook) {
	switch hookPoint {
	case boil.BeforeInsertHook:
		adminUnauthorizedTrustlineBeforeInsertHooks = append(adminUnauthorizedTrustlineBeforeInsertHooks, adminUnauthorizedTrustlineHook)
	case boil.BeforeUpdateHook:
		adminUnauthorizedTrustlineBeforeUpdateHooks = append(adminUnauthorizedTrustlineBeforeUpdateHooks, adminUnauthorizedTrustlineHook)
	case boil.BeforeDeleteHook:
		adminUnauthorizedTrustlineBeforeDeleteHooks = append(adminUnauthorizedTrustlineBeforeDeleteHooks, adminUnauthorizedTrustlineHook)
	case boil.BeforeUpsertHook:
		adminUnauthorizedTrustlineBeforeUpsertHooks = append(adminUnauthorizedTrustlineBeforeUpsertHooks, adminUnauthorizedTrustlineHook)
	case boil.AfterInsertHook:
		adminUnauthorizedTrustlineAfterInsertHooks = append(adminUnauthorizedTrustlineAfterInsertHooks, adminUnauthorizedTrustlineHook)
	case boil.AfterSelectHook:
		adminUnauthorizedTrustlineAfterSelectHooks = append(adminUnauthorizedTrustlineAfterSelectHooks, adminUnauthorizedTrustlineHook)
	case boil.AfterUpdateHook:
		adminUnauthorizedTrustlineAfterUpdateHooks = append(adminUnauthorizedTrustlineAfterUpdateHooks, adminUnauthorizedTrustlineHook)
	case boil.AfterDeleteHook:
		adminUnauthorizedTrustlineAfterDeleteHooks = append(adminUnauthorizedTrustlineAfterDeleteHooks, adminUnauthorizedTrustlineHook)
	case boil.AfterUpsertHook:
		adminUnauthorizedTrustlineAfterUpsertHooks = append(adminUnauthorizedTrustlineAfterUpsertHooks, adminUnauthorizedTrustlineHook)
	}
}

// OneG returns a single adminUnauthorizedTrustline record from the query using the global executor.
func (q adminUnauthorizedTrustlineQuery) OneG() (*AdminUnauthorizedTrustline, error) {
	return q.One(boil.GetDB())
}

// One returns a single adminUnauthorizedTrustline record from the query.
func (q adminUnauthorizedTrustlineQuery) One(exec boil.Executor) (*AdminUnauthorizedTrustline, error) {
	o := &AdminUnauthorizedTrustline{}

	queries.SetLimit(q.Query, 1)

	err := q.Bind(nil, exec, o)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: failed to execute a one query for admin_unauthorized_trustline")
	}

	if err := o.doAfterSelectHooks(exec); err != nil {
		return o, err
	}

	return o, nil
}

// AllG returns all AdminUnauthorizedTrustline records from the query using the global executor.
func (q adminUnauthorizedTrustlineQuery) AllG() (AdminUnauthorizedTrustlineSlice, error) {
	return q.All(boil.GetDB())
}

// All returns all AdminUnauthorizedTrustline records from the query.
func (q adminUnauthorizedTrustlineQuery) All(exec boil.Executor) (AdminUnauthorizedTrustlineSlice, error) {
	var o []*AdminUnauthorizedTrustline

	err := q.Bind(nil, exec, &o)
	if err != nil {
		return nil, errors.Wrap(err, "models: failed to assign all query results to AdminUnauthorizedTrustline slice")
	}

	if len(adminUnauthorizedTrustlineAfterSelectHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterSelectHooks(exec); err != nil {
				return o, err
			}
		}
	}

	return o, nil
}

// CountG returns the count of all AdminUnauthorizedTrustline records in the query, and panics on error.
func (q adminUnauthorizedTrustlineQuery) CountG() (int64, error) {
	return q.Count(boil.GetDB())
}

// Count returns the count of all AdminUnauthorizedTrustline records in the query.
func (q adminUnauthorizedTrustlineQuery) Count(exec boil.Executor) (int64, error) {
	var count int64

	queries.SetSelect(q.Query, nil)
	queries.SetCount(q.Query)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to count admin_unauthorized_trustline rows")
	}

	return count, nil
}

// ExistsG checks if the row exists in the table, and panics on error.
func (q adminUnauthorizedTrustlineQuery) ExistsG() (bool, error) {
	return q.Exists(boil.GetDB())
}

// Exists checks if the row exists in the table.
func (q adminUnauthorizedTrustlineQuery) Exists(exec boil.Executor) (bool, error) {
	var count int64

	queries.SetCount(q.Query)
	queries.SetLimit(q.Query, 1)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return false, errors.Wrap(err, "models: failed to check if admin_unauthorized_trustline exists")
	}

	return count > 0, nil
}

// IssuerPublicKey pointed to by the foreign key.
func (o *AdminUnauthorizedTrustline) IssuerPublicKey(mods ...qm.QueryMod) adminStellarAccountQuery {
	queryMods := []qm.QueryMod{
		qm.Where("public_key=?", o.IssuerPublicKeyID),
	}

	queryMods = append(queryMods, mods...)

	query := AdminStellarAccounts(queryMods...)
	queries.SetFrom(query.Query, "\"admin_stellar_account\"")

	return query
}

// LoadIssuerPublicKey allows an eager lookup of values, cached into the
// loaded structs of the objects. This is for an N-1 relationship.
func (adminUnauthorizedTrustlineL) LoadIssuerPublicKey(e boil.Executor, singular bool, maybeAdminUnauthorizedTrustline interface{}, mods queries.Applicator) error {
	var slice []*AdminUnauthorizedTrustline
	var object *AdminUnauthorizedTrustline

	if singular {
		object = maybeAdminUnauthorizedTrustline.(*AdminUnauthorizedTrustline)
	} else {
		slice = *maybeAdminUnauthorizedTrustline.(*[]*AdminUnauthorizedTrustline)
	}

	args := make([]interface{}, 0, 1)
	if singular {
		if object.R == nil {
			object.R = &adminUnauthorizedTrustlineR{}
		}
		args = append(args, object.IssuerPublicKeyID)
	} else {
	Outer:
		for _, obj := range slice {
			if obj.R == nil {
				obj.R = &adminUnauthorizedTrustlineR{}
			}

			for _, a := range args {
				if a == obj.IssuerPublicKeyID {
					continue Outer
				}
			}

			args = append(args, obj.IssuerPublicKeyID)
		}
	}

	query := NewQuery(qm.From(`admin_stellar_account`), qm.WhereIn(`public_key in ?`, args...))
	if mods != nil {
		mods.Apply(query)
	}

	results, err := query.Query(e)
	if err != nil {
		return errors.Wrap(err, "failed to eager load AdminStellarAccount")
	}

	var resultSlice []*AdminStellarAccount
	if err = queries.Bind(results, &resultSlice); err != nil {
		return errors.Wrap(err, "failed to bind eager loaded slice AdminStellarAccount")
	}

	if err = results.Close(); err != nil {
		return errors.Wrap(err, "failed to close results of eager load for admin_stellar_account")
	}
	if err = results.Err(); err != nil {
		return errors.Wrap(err, "error occurred during iteration of eager loaded relations for admin_stellar_account")
	}

	if len(adminUnauthorizedTrustlineAfterSelectHooks) != 0 {
		for _, obj := range resultSlice {
			if err := obj.doAfterSelectHooks(e); err != nil {
				return err
			}
		}
	}

	if len(resultSlice) == 0 {
		return nil
	}

	if singular {
		foreign := resultSlice[0]
		object.R.IssuerPublicKey = foreign
		if foreign.R == nil {
			foreign.R = &adminStellarAccountR{}
		}
		foreign.R.IssuerPublicKeyAdminUnauthorizedTrustlines = append(foreign.R.IssuerPublicKeyAdminUnauthorizedTrustlines, object)
		return nil
	}

	for _, local := range slice {
		for _, foreign := range resultSlice {
			if local.IssuerPublicKeyID == foreign.PublicKey {
				local.R.IssuerPublicKey = foreign
				if foreign.R == nil {
					foreign.R = &adminStellarAccountR{}
				}
				foreign.R.IssuerPublicKeyAdminUnauthorizedTrustlines = append(foreign.R.IssuerPublicKeyAdminUnauthorizedTrustlines, local)
				break
			}
		}
	}

	return nil
}

// SetIssuerPublicKeyG of the adminUnauthorizedTrustline to the related item.
// Sets o.R.IssuerPublicKey to related.
// Adds o to related.R.IssuerPublicKeyAdminUnauthorizedTrustlines.
// Uses the global database handle.
func (o *AdminUnauthorizedTrustline) SetIssuerPublicKeyG(insert bool, related *AdminStellarAccount) error {
	return o.SetIssuerPublicKey(boil.GetDB(), insert, related)
}

// SetIssuerPublicKey of the adminUnauthorizedTrustline to the related item.
// Sets o.R.IssuerPublicKey to related.
// Adds o to related.R.IssuerPublicKeyAdminUnauthorizedTrustlines.
func (o *AdminUnauthorizedTrustline) SetIssuerPublicKey(exec boil.Executor, insert bool, related *AdminStellarAccount) error {
	var err error
	if insert {
		if err = related.Insert(exec, boil.Infer()); err != nil {
			return errors.Wrap(err, "failed to insert into foreign table")
		}
	}

	updateQuery := fmt.Sprintf(
		"UPDATE \"admin_unauthorized_trustline\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, []string{"issuer_public_key_id"}),
		strmangle.WhereClause("\"", "\"", 2, adminUnauthorizedTrustlinePrimaryKeyColumns),
	)
	values := []interface{}{related.PublicKey, o.ID}

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, updateQuery)
		fmt.Fprintln(boil.DebugWriter, values)
	}

	if _, err = exec.Exec(updateQuery, values...); err != nil {
		return errors.Wrap(err, "failed to update local table")
	}

	o.IssuerPublicKeyID = related.PublicKey
	if o.R == nil {
		o.R = &adminUnauthorizedTrustlineR{
			IssuerPublicKey: related,
		}
	} else {
		o.R.IssuerPublicKey = related
	}

	if related.R == nil {
		related.R = &adminStellarAccountR{
			IssuerPublicKeyAdminUnauthorizedTrustlines: AdminUnauthorizedTrustlineSlice{o},
		}
	} else {
		related.R.IssuerPublicKeyAdminUnauthorizedTrustlines = append(related.R.IssuerPublicKeyAdminUnauthorizedTrustlines, o)
	}

	return nil
}

// AdminUnauthorizedTrustlines retrieves all the records using an executor.
func AdminUnauthorizedTrustlines(mods ...qm.QueryMod) adminUnauthorizedTrustlineQuery {
	mods = append(mods, qm.From("\"admin_unauthorized_trustline\""))
	return adminUnauthorizedTrustlineQuery{NewQuery(mods...)}
}

// FindAdminUnauthorizedTrustlineG retrieves a single record by ID.
func FindAdminUnauthorizedTrustlineG(iD int, selectCols ...string) (*AdminUnauthorizedTrustline, error) {
	return FindAdminUnauthorizedTrustline(boil.GetDB(), iD, selectCols...)
}

// FindAdminUnauthorizedTrustline retrieves a single record by ID with an executor.
// If selectCols is empty Find will return all columns.
func FindAdminUnauthorizedTrustline(exec boil.Executor, iD int, selectCols ...string) (*AdminUnauthorizedTrustline, error) {
	adminUnauthorizedTrustlineObj := &AdminUnauthorizedTrustline{}

	sel := "*"
	if len(selectCols) > 0 {
		sel = strings.Join(strmangle.IdentQuoteSlice(dialect.LQ, dialect.RQ, selectCols), ",")
	}
	query := fmt.Sprintf(
		"select %s from \"admin_unauthorized_trustline\" where \"id\"=$1", sel,
	)

	q := queries.Raw(query, iD)

	err := q.Bind(nil, exec, adminUnauthorizedTrustlineObj)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: unable to select from admin_unauthorized_trustline")
	}

	return adminUnauthorizedTrustlineObj, nil
}

// InsertG a single record. See Insert for whitelist behavior description.
func (o *AdminUnauthorizedTrustline) InsertG(columns boil.Columns) error {
	return o.Insert(boil.GetDB(), columns)
}

// Insert a single record using an executor.
// See boil.Columns.InsertColumnSet documentation to understand column list inference for inserts.
func (o *AdminUnauthorizedTrustline) Insert(exec boil.Executor, columns boil.Columns) error {
	if o == nil {
		return errors.New("models: no admin_unauthorized_trustline provided for insertion")
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

	nzDefaults := queries.NonZeroDefaultSet(adminUnauthorizedTrustlineColumnsWithDefault, o)

	key := makeCacheKey(columns, nzDefaults)
	adminUnauthorizedTrustlineInsertCacheMut.RLock()
	cache, cached := adminUnauthorizedTrustlineInsertCache[key]
	adminUnauthorizedTrustlineInsertCacheMut.RUnlock()

	if !cached {
		wl, returnColumns := columns.InsertColumnSet(
			adminUnauthorizedTrustlineColumns,
			adminUnauthorizedTrustlineColumnsWithDefault,
			adminUnauthorizedTrustlineColumnsWithoutDefault,
			nzDefaults,
		)

		cache.valueMapping, err = queries.BindMapping(adminUnauthorizedTrustlineType, adminUnauthorizedTrustlineMapping, wl)
		if err != nil {
			return err
		}
		cache.retMapping, err = queries.BindMapping(adminUnauthorizedTrustlineType, adminUnauthorizedTrustlineMapping, returnColumns)
		if err != nil {
			return err
		}
		if len(wl) != 0 {
			cache.query = fmt.Sprintf("INSERT INTO \"admin_unauthorized_trustline\" (\"%s\") %%sVALUES (%s)%%s", strings.Join(wl, "\",\""), strmangle.Placeholders(dialect.UseIndexPlaceholders, len(wl), 1, 1))
		} else {
			cache.query = "INSERT INTO \"admin_unauthorized_trustline\" %sDEFAULT VALUES%s"
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
		return errors.Wrap(err, "models: unable to insert into admin_unauthorized_trustline")
	}

	if !cached {
		adminUnauthorizedTrustlineInsertCacheMut.Lock()
		adminUnauthorizedTrustlineInsertCache[key] = cache
		adminUnauthorizedTrustlineInsertCacheMut.Unlock()
	}

	return o.doAfterInsertHooks(exec)
}

// UpdateG a single AdminUnauthorizedTrustline record using the global executor.
// See Update for more documentation.
func (o *AdminUnauthorizedTrustline) UpdateG(columns boil.Columns) (int64, error) {
	return o.Update(boil.GetDB(), columns)
}

// Update uses an executor to update the AdminUnauthorizedTrustline.
// See boil.Columns.UpdateColumnSet documentation to understand column list inference for updates.
// Update does not automatically update the record in case of default values. Use .Reload() to refresh the records.
func (o *AdminUnauthorizedTrustline) Update(exec boil.Executor, columns boil.Columns) (int64, error) {
	currTime := time.Now().In(boil.GetLocation())

	o.UpdatedAt = currTime

	var err error
	if err = o.doBeforeUpdateHooks(exec); err != nil {
		return 0, err
	}
	key := makeCacheKey(columns, nil)
	adminUnauthorizedTrustlineUpdateCacheMut.RLock()
	cache, cached := adminUnauthorizedTrustlineUpdateCache[key]
	adminUnauthorizedTrustlineUpdateCacheMut.RUnlock()

	if !cached {
		wl := columns.UpdateColumnSet(
			adminUnauthorizedTrustlineColumns,
			adminUnauthorizedTrustlinePrimaryKeyColumns,
		)

		if !columns.IsWhitelist() {
			wl = strmangle.SetComplement(wl, []string{"created_at"})
		}
		if len(wl) == 0 {
			return 0, errors.New("models: unable to update admin_unauthorized_trustline, could not build whitelist")
		}

		cache.query = fmt.Sprintf("UPDATE \"admin_unauthorized_trustline\" SET %s WHERE %s",
			strmangle.SetParamNames("\"", "\"", 1, wl),
			strmangle.WhereClause("\"", "\"", len(wl)+1, adminUnauthorizedTrustlinePrimaryKeyColumns),
		)
		cache.valueMapping, err = queries.BindMapping(adminUnauthorizedTrustlineType, adminUnauthorizedTrustlineMapping, append(wl, adminUnauthorizedTrustlinePrimaryKeyColumns...))
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
		return 0, errors.Wrap(err, "models: unable to update admin_unauthorized_trustline row")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by update for admin_unauthorized_trustline")
	}

	if !cached {
		adminUnauthorizedTrustlineUpdateCacheMut.Lock()
		adminUnauthorizedTrustlineUpdateCache[key] = cache
		adminUnauthorizedTrustlineUpdateCacheMut.Unlock()
	}

	return rowsAff, o.doAfterUpdateHooks(exec)
}

// UpdateAll updates all rows with the specified column values.
func (q adminUnauthorizedTrustlineQuery) UpdateAll(exec boil.Executor, cols M) (int64, error) {
	queries.SetUpdate(q.Query, cols)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all for admin_unauthorized_trustline")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected for admin_unauthorized_trustline")
	}

	return rowsAff, nil
}

// UpdateAllG updates all rows with the specified column values.
func (o AdminUnauthorizedTrustlineSlice) UpdateAllG(cols M) (int64, error) {
	return o.UpdateAll(boil.GetDB(), cols)
}

// UpdateAll updates all rows with the specified column values, using an executor.
func (o AdminUnauthorizedTrustlineSlice) UpdateAll(exec boil.Executor, cols M) (int64, error) {
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
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), adminUnauthorizedTrustlinePrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := fmt.Sprintf("UPDATE \"admin_unauthorized_trustline\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, colNames),
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), len(colNames)+1, adminUnauthorizedTrustlinePrimaryKeyColumns, len(o)))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all in adminUnauthorizedTrustline slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected all in update all adminUnauthorizedTrustline")
	}
	return rowsAff, nil
}

// UpsertG attempts an insert, and does an update or ignore on conflict.
func (o *AdminUnauthorizedTrustline) UpsertG(updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	return o.Upsert(boil.GetDB(), updateOnConflict, conflictColumns, updateColumns, insertColumns)
}

// Upsert attempts an insert using an executor, and does an update or ignore on conflict.
// See boil.Columns documentation for how to properly use updateColumns and insertColumns.
func (o *AdminUnauthorizedTrustline) Upsert(exec boil.Executor, updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	if o == nil {
		return errors.New("models: no admin_unauthorized_trustline provided for upsert")
	}
	currTime := time.Now().In(boil.GetLocation())

	if o.CreatedAt.IsZero() {
		o.CreatedAt = currTime
	}
	o.UpdatedAt = currTime

	if err := o.doBeforeUpsertHooks(exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(adminUnauthorizedTrustlineColumnsWithDefault, o)

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

	adminUnauthorizedTrustlineUpsertCacheMut.RLock()
	cache, cached := adminUnauthorizedTrustlineUpsertCache[key]
	adminUnauthorizedTrustlineUpsertCacheMut.RUnlock()

	var err error

	if !cached {
		insert, ret := insertColumns.InsertColumnSet(
			adminUnauthorizedTrustlineColumns,
			adminUnauthorizedTrustlineColumnsWithDefault,
			adminUnauthorizedTrustlineColumnsWithoutDefault,
			nzDefaults,
		)
		update := updateColumns.UpdateColumnSet(
			adminUnauthorizedTrustlineColumns,
			adminUnauthorizedTrustlinePrimaryKeyColumns,
		)

		if len(update) == 0 {
			return errors.New("models: unable to upsert admin_unauthorized_trustline, could not build update column list")
		}

		conflict := conflictColumns
		if len(conflict) == 0 {
			conflict = make([]string, len(adminUnauthorizedTrustlinePrimaryKeyColumns))
			copy(conflict, adminUnauthorizedTrustlinePrimaryKeyColumns)
		}
		cache.query = buildUpsertQueryPostgres(dialect, "\"admin_unauthorized_trustline\"", updateOnConflict, ret, update, conflict, insert)

		cache.valueMapping, err = queries.BindMapping(adminUnauthorizedTrustlineType, adminUnauthorizedTrustlineMapping, insert)
		if err != nil {
			return err
		}
		if len(ret) != 0 {
			cache.retMapping, err = queries.BindMapping(adminUnauthorizedTrustlineType, adminUnauthorizedTrustlineMapping, ret)
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
		return errors.Wrap(err, "models: unable to upsert admin_unauthorized_trustline")
	}

	if !cached {
		adminUnauthorizedTrustlineUpsertCacheMut.Lock()
		adminUnauthorizedTrustlineUpsertCache[key] = cache
		adminUnauthorizedTrustlineUpsertCacheMut.Unlock()
	}

	return o.doAfterUpsertHooks(exec)
}

// DeleteG deletes a single AdminUnauthorizedTrustline record.
// DeleteG will match against the primary key column to find the record to delete.
func (o *AdminUnauthorizedTrustline) DeleteG() (int64, error) {
	return o.Delete(boil.GetDB())
}

// Delete deletes a single AdminUnauthorizedTrustline record with an executor.
// Delete will match against the primary key column to find the record to delete.
func (o *AdminUnauthorizedTrustline) Delete(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no AdminUnauthorizedTrustline provided for delete")
	}

	if err := o.doBeforeDeleteHooks(exec); err != nil {
		return 0, err
	}

	args := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(o)), adminUnauthorizedTrustlinePrimaryKeyMapping)
	sql := "DELETE FROM \"admin_unauthorized_trustline\" WHERE \"id\"=$1"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete from admin_unauthorized_trustline")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by delete for admin_unauthorized_trustline")
	}

	if err := o.doAfterDeleteHooks(exec); err != nil {
		return 0, err
	}

	return rowsAff, nil
}

// DeleteAll deletes all matching rows.
func (q adminUnauthorizedTrustlineQuery) DeleteAll(exec boil.Executor) (int64, error) {
	if q.Query == nil {
		return 0, errors.New("models: no adminUnauthorizedTrustlineQuery provided for delete all")
	}

	queries.SetDelete(q.Query)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from admin_unauthorized_trustline")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for admin_unauthorized_trustline")
	}

	return rowsAff, nil
}

// DeleteAllG deletes all rows in the slice.
func (o AdminUnauthorizedTrustlineSlice) DeleteAllG() (int64, error) {
	return o.DeleteAll(boil.GetDB())
}

// DeleteAll deletes all rows in the slice, using an executor.
func (o AdminUnauthorizedTrustlineSlice) DeleteAll(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no AdminUnauthorizedTrustline slice provided for delete all")
	}

	if len(o) == 0 {
		return 0, nil
	}

	if len(adminUnauthorizedTrustlineBeforeDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doBeforeDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	var args []interface{}
	for _, obj := range o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), adminUnauthorizedTrustlinePrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "DELETE FROM \"admin_unauthorized_trustline\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, adminUnauthorizedTrustlinePrimaryKeyColumns, len(o))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from adminUnauthorizedTrustline slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for admin_unauthorized_trustline")
	}

	if len(adminUnauthorizedTrustlineAfterDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	return rowsAff, nil
}

// ReloadG refetches the object from the database using the primary keys.
func (o *AdminUnauthorizedTrustline) ReloadG() error {
	if o == nil {
		return errors.New("models: no AdminUnauthorizedTrustline provided for reload")
	}

	return o.Reload(boil.GetDB())
}

// Reload refetches the object from the database
// using the primary keys with an executor.
func (o *AdminUnauthorizedTrustline) Reload(exec boil.Executor) error {
	ret, err := FindAdminUnauthorizedTrustline(exec, o.ID)
	if err != nil {
		return err
	}

	*o = *ret
	return nil
}

// ReloadAllG refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *AdminUnauthorizedTrustlineSlice) ReloadAllG() error {
	if o == nil {
		return errors.New("models: empty AdminUnauthorizedTrustlineSlice provided for reload all")
	}

	return o.ReloadAll(boil.GetDB())
}

// ReloadAll refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *AdminUnauthorizedTrustlineSlice) ReloadAll(exec boil.Executor) error {
	if o == nil || len(*o) == 0 {
		return nil
	}

	slice := AdminUnauthorizedTrustlineSlice{}
	var args []interface{}
	for _, obj := range *o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), adminUnauthorizedTrustlinePrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "SELECT \"admin_unauthorized_trustline\".* FROM \"admin_unauthorized_trustline\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, adminUnauthorizedTrustlinePrimaryKeyColumns, len(*o))

	q := queries.Raw(sql, args...)

	err := q.Bind(nil, exec, &slice)
	if err != nil {
		return errors.Wrap(err, "models: unable to reload all in AdminUnauthorizedTrustlineSlice")
	}

	*o = slice

	return nil
}

// AdminUnauthorizedTrustlineExistsG checks if the AdminUnauthorizedTrustline row exists.
func AdminUnauthorizedTrustlineExistsG(iD int) (bool, error) {
	return AdminUnauthorizedTrustlineExists(boil.GetDB(), iD)
}

// AdminUnauthorizedTrustlineExists checks if the AdminUnauthorizedTrustline row exists.
func AdminUnauthorizedTrustlineExists(exec boil.Executor, iD int) (bool, error) {
	var exists bool
	sql := "select exists(select 1 from \"admin_unauthorized_trustline\" where \"id\"=$1 limit 1)"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, iD)
	}

	row := exec.QueryRow(sql, iD)

	err := row.Scan(&exists)
	if err != nil {
		return false, errors.Wrap(err, "models: unable to check if admin_unauthorized_trustline exists")
	}

	return exists, nil
}
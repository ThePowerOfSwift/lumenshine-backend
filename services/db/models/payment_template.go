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

// PaymentTemplate is an object representing the database table.
type PaymentTemplate struct {
	ID                      int       `boil:"id" json:"id" toml:"id" yaml:"id"`
	WalletID                int       `boil:"wallet_id" json:"wallet_id" toml:"wallet_id" yaml:"wallet_id"`
	RecepientStellarAddress string    `boil:"recepient_stellar_address" json:"recepient_stellar_address" toml:"recepient_stellar_address" yaml:"recepient_stellar_address"`
	RecepientPK             string    `boil:"recepient_pk" json:"recepient_pk" toml:"recepient_pk" yaml:"recepient_pk"`
	AssetCode               string    `boil:"asset_code" json:"asset_code" toml:"asset_code" yaml:"asset_code"`
	IssuerPK                string    `boil:"issuer_pk" json:"issuer_pk" toml:"issuer_pk" yaml:"issuer_pk"`
	Amount                  int64     `boil:"amount" json:"amount" toml:"amount" yaml:"amount"`
	MemoType                string    `boil:"memo_type" json:"memo_type" toml:"memo_type" yaml:"memo_type"`
	Memo                    string    `boil:"memo" json:"memo" toml:"memo" yaml:"memo"`
	CreatedAt               time.Time `boil:"created_at" json:"created_at" toml:"created_at" yaml:"created_at"`
	UpdatedAt               time.Time `boil:"updated_at" json:"updated_at" toml:"updated_at" yaml:"updated_at"`
	UpdatedBy               string    `boil:"updated_by" json:"updated_by" toml:"updated_by" yaml:"updated_by"`

	R *paymentTemplateR `boil:"-" json:"-" toml:"-" yaml:"-"`
	L paymentTemplateL  `boil:"-" json:"-" toml:"-" yaml:"-"`
}

var PaymentTemplateColumns = struct {
	ID                      string
	WalletID                string
	RecepientStellarAddress string
	RecepientPK             string
	AssetCode               string
	IssuerPK                string
	Amount                  string
	MemoType                string
	Memo                    string
	CreatedAt               string
	UpdatedAt               string
	UpdatedBy               string
}{
	ID:                      "id",
	WalletID:                "wallet_id",
	RecepientStellarAddress: "recepient_stellar_address",
	RecepientPK:             "recepient_pk",
	AssetCode:               "asset_code",
	IssuerPK:                "issuer_pk",
	Amount:                  "amount",
	MemoType:                "memo_type",
	Memo:                    "memo",
	CreatedAt:               "created_at",
	UpdatedAt:               "updated_at",
	UpdatedBy:               "updated_by",
}

// PaymentTemplateRels is where relationship names are stored.
var PaymentTemplateRels = struct {
	Wallet string
}{
	Wallet: "Wallet",
}

// paymentTemplateR is where relationships are stored.
type paymentTemplateR struct {
	Wallet *UserWallet
}

// NewStruct creates a new relationship struct
func (*paymentTemplateR) NewStruct() *paymentTemplateR {
	return &paymentTemplateR{}
}

// paymentTemplateL is where Load methods for each relationship are stored.
type paymentTemplateL struct{}

var (
	paymentTemplateColumns               = []string{"id", "wallet_id", "recepient_stellar_address", "recepient_pk", "asset_code", "issuer_pk", "amount", "memo_type", "memo", "created_at", "updated_at", "updated_by"}
	paymentTemplateColumnsWithoutDefault = []string{"wallet_id", "recepient_pk", "asset_code", "amount", "memo_type", "updated_by"}
	paymentTemplateColumnsWithDefault    = []string{"id", "recepient_stellar_address", "issuer_pk", "memo", "created_at", "updated_at"}
	paymentTemplatePrimaryKeyColumns     = []string{"id"}
)

type (
	// PaymentTemplateSlice is an alias for a slice of pointers to PaymentTemplate.
	// This should generally be used opposed to []PaymentTemplate.
	PaymentTemplateSlice []*PaymentTemplate
	// PaymentTemplateHook is the signature for custom PaymentTemplate hook methods
	PaymentTemplateHook func(boil.Executor, *PaymentTemplate) error

	paymentTemplateQuery struct {
		*queries.Query
	}
)

// Cache for insert, update and upsert
var (
	paymentTemplateType                 = reflect.TypeOf(&PaymentTemplate{})
	paymentTemplateMapping              = queries.MakeStructMapping(paymentTemplateType)
	paymentTemplatePrimaryKeyMapping, _ = queries.BindMapping(paymentTemplateType, paymentTemplateMapping, paymentTemplatePrimaryKeyColumns)
	paymentTemplateInsertCacheMut       sync.RWMutex
	paymentTemplateInsertCache          = make(map[string]insertCache)
	paymentTemplateUpdateCacheMut       sync.RWMutex
	paymentTemplateUpdateCache          = make(map[string]updateCache)
	paymentTemplateUpsertCacheMut       sync.RWMutex
	paymentTemplateUpsertCache          = make(map[string]insertCache)
)

var (
	// Force time package dependency for automated UpdatedAt/CreatedAt.
	_ = time.Second
)

var paymentTemplateBeforeInsertHooks []PaymentTemplateHook
var paymentTemplateBeforeUpdateHooks []PaymentTemplateHook
var paymentTemplateBeforeDeleteHooks []PaymentTemplateHook
var paymentTemplateBeforeUpsertHooks []PaymentTemplateHook

var paymentTemplateAfterInsertHooks []PaymentTemplateHook
var paymentTemplateAfterSelectHooks []PaymentTemplateHook
var paymentTemplateAfterUpdateHooks []PaymentTemplateHook
var paymentTemplateAfterDeleteHooks []PaymentTemplateHook
var paymentTemplateAfterUpsertHooks []PaymentTemplateHook

// doBeforeInsertHooks executes all "before insert" hooks.
func (o *PaymentTemplate) doBeforeInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateBeforeInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpdateHooks executes all "before Update" hooks.
func (o *PaymentTemplate) doBeforeUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateBeforeUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeDeleteHooks executes all "before Delete" hooks.
func (o *PaymentTemplate) doBeforeDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateBeforeDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpsertHooks executes all "before Upsert" hooks.
func (o *PaymentTemplate) doBeforeUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateBeforeUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterInsertHooks executes all "after Insert" hooks.
func (o *PaymentTemplate) doAfterInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateAfterInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterSelectHooks executes all "after Select" hooks.
func (o *PaymentTemplate) doAfterSelectHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateAfterSelectHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpdateHooks executes all "after Update" hooks.
func (o *PaymentTemplate) doAfterUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateAfterUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterDeleteHooks executes all "after Delete" hooks.
func (o *PaymentTemplate) doAfterDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateAfterDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpsertHooks executes all "after Upsert" hooks.
func (o *PaymentTemplate) doAfterUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range paymentTemplateAfterUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// AddPaymentTemplateHook registers your hook function for all future operations.
func AddPaymentTemplateHook(hookPoint boil.HookPoint, paymentTemplateHook PaymentTemplateHook) {
	switch hookPoint {
	case boil.BeforeInsertHook:
		paymentTemplateBeforeInsertHooks = append(paymentTemplateBeforeInsertHooks, paymentTemplateHook)
	case boil.BeforeUpdateHook:
		paymentTemplateBeforeUpdateHooks = append(paymentTemplateBeforeUpdateHooks, paymentTemplateHook)
	case boil.BeforeDeleteHook:
		paymentTemplateBeforeDeleteHooks = append(paymentTemplateBeforeDeleteHooks, paymentTemplateHook)
	case boil.BeforeUpsertHook:
		paymentTemplateBeforeUpsertHooks = append(paymentTemplateBeforeUpsertHooks, paymentTemplateHook)
	case boil.AfterInsertHook:
		paymentTemplateAfterInsertHooks = append(paymentTemplateAfterInsertHooks, paymentTemplateHook)
	case boil.AfterSelectHook:
		paymentTemplateAfterSelectHooks = append(paymentTemplateAfterSelectHooks, paymentTemplateHook)
	case boil.AfterUpdateHook:
		paymentTemplateAfterUpdateHooks = append(paymentTemplateAfterUpdateHooks, paymentTemplateHook)
	case boil.AfterDeleteHook:
		paymentTemplateAfterDeleteHooks = append(paymentTemplateAfterDeleteHooks, paymentTemplateHook)
	case boil.AfterUpsertHook:
		paymentTemplateAfterUpsertHooks = append(paymentTemplateAfterUpsertHooks, paymentTemplateHook)
	}
}

// OneG returns a single paymentTemplate record from the query using the global executor.
func (q paymentTemplateQuery) OneG() (*PaymentTemplate, error) {
	return q.One(boil.GetDB())
}

// One returns a single paymentTemplate record from the query.
func (q paymentTemplateQuery) One(exec boil.Executor) (*PaymentTemplate, error) {
	o := &PaymentTemplate{}

	queries.SetLimit(q.Query, 1)

	err := q.Bind(nil, exec, o)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: failed to execute a one query for payment_template")
	}

	if err := o.doAfterSelectHooks(exec); err != nil {
		return o, err
	}

	return o, nil
}

// AllG returns all PaymentTemplate records from the query using the global executor.
func (q paymentTemplateQuery) AllG() (PaymentTemplateSlice, error) {
	return q.All(boil.GetDB())
}

// All returns all PaymentTemplate records from the query.
func (q paymentTemplateQuery) All(exec boil.Executor) (PaymentTemplateSlice, error) {
	var o []*PaymentTemplate

	err := q.Bind(nil, exec, &o)
	if err != nil {
		return nil, errors.Wrap(err, "models: failed to assign all query results to PaymentTemplate slice")
	}

	if len(paymentTemplateAfterSelectHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterSelectHooks(exec); err != nil {
				return o, err
			}
		}
	}

	return o, nil
}

// CountG returns the count of all PaymentTemplate records in the query, and panics on error.
func (q paymentTemplateQuery) CountG() (int64, error) {
	return q.Count(boil.GetDB())
}

// Count returns the count of all PaymentTemplate records in the query.
func (q paymentTemplateQuery) Count(exec boil.Executor) (int64, error) {
	var count int64

	queries.SetSelect(q.Query, nil)
	queries.SetCount(q.Query)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to count payment_template rows")
	}

	return count, nil
}

// ExistsG checks if the row exists in the table, and panics on error.
func (q paymentTemplateQuery) ExistsG() (bool, error) {
	return q.Exists(boil.GetDB())
}

// Exists checks if the row exists in the table.
func (q paymentTemplateQuery) Exists(exec boil.Executor) (bool, error) {
	var count int64

	queries.SetCount(q.Query)
	queries.SetLimit(q.Query, 1)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return false, errors.Wrap(err, "models: failed to check if payment_template exists")
	}

	return count > 0, nil
}

// Wallet pointed to by the foreign key.
func (o *PaymentTemplate) Wallet(mods ...qm.QueryMod) userWalletQuery {
	queryMods := []qm.QueryMod{
		qm.Where("id=?", o.WalletID),
	}

	queryMods = append(queryMods, mods...)

	query := UserWallets(queryMods...)
	queries.SetFrom(query.Query, "\"user_wallet\"")

	return query
}

// LoadWallet allows an eager lookup of values, cached into the
// loaded structs of the objects. This is for an N-1 relationship.
func (paymentTemplateL) LoadWallet(e boil.Executor, singular bool, maybePaymentTemplate interface{}, mods queries.Applicator) error {
	var slice []*PaymentTemplate
	var object *PaymentTemplate

	if singular {
		object = maybePaymentTemplate.(*PaymentTemplate)
	} else {
		slice = *maybePaymentTemplate.(*[]*PaymentTemplate)
	}

	args := make([]interface{}, 0, 1)
	if singular {
		if object.R == nil {
			object.R = &paymentTemplateR{}
		}
		args = append(args, object.WalletID)
	} else {
	Outer:
		for _, obj := range slice {
			if obj.R == nil {
				obj.R = &paymentTemplateR{}
			}

			for _, a := range args {
				if a == obj.WalletID {
					continue Outer
				}
			}

			args = append(args, obj.WalletID)
		}
	}

	query := NewQuery(qm.From(`user_wallet`), qm.WhereIn(`id in ?`, args...))
	if mods != nil {
		mods.Apply(query)
	}

	results, err := query.Query(e)
	if err != nil {
		return errors.Wrap(err, "failed to eager load UserWallet")
	}

	var resultSlice []*UserWallet
	if err = queries.Bind(results, &resultSlice); err != nil {
		return errors.Wrap(err, "failed to bind eager loaded slice UserWallet")
	}

	if err = results.Close(); err != nil {
		return errors.Wrap(err, "failed to close results of eager load for user_wallet")
	}
	if err = results.Err(); err != nil {
		return errors.Wrap(err, "error occurred during iteration of eager loaded relations for user_wallet")
	}

	if len(paymentTemplateAfterSelectHooks) != 0 {
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
		object.R.Wallet = foreign
		if foreign.R == nil {
			foreign.R = &userWalletR{}
		}
		foreign.R.WalletPaymentTemplates = append(foreign.R.WalletPaymentTemplates, object)
		return nil
	}

	for _, local := range slice {
		for _, foreign := range resultSlice {
			if local.WalletID == foreign.ID {
				local.R.Wallet = foreign
				if foreign.R == nil {
					foreign.R = &userWalletR{}
				}
				foreign.R.WalletPaymentTemplates = append(foreign.R.WalletPaymentTemplates, local)
				break
			}
		}
	}

	return nil
}

// SetWalletG of the paymentTemplate to the related item.
// Sets o.R.Wallet to related.
// Adds o to related.R.WalletPaymentTemplates.
// Uses the global database handle.
func (o *PaymentTemplate) SetWalletG(insert bool, related *UserWallet) error {
	return o.SetWallet(boil.GetDB(), insert, related)
}

// SetWallet of the paymentTemplate to the related item.
// Sets o.R.Wallet to related.
// Adds o to related.R.WalletPaymentTemplates.
func (o *PaymentTemplate) SetWallet(exec boil.Executor, insert bool, related *UserWallet) error {
	var err error
	if insert {
		if err = related.Insert(exec, boil.Infer()); err != nil {
			return errors.Wrap(err, "failed to insert into foreign table")
		}
	}

	updateQuery := fmt.Sprintf(
		"UPDATE \"payment_template\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, []string{"wallet_id"}),
		strmangle.WhereClause("\"", "\"", 2, paymentTemplatePrimaryKeyColumns),
	)
	values := []interface{}{related.ID, o.ID}

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, updateQuery)
		fmt.Fprintln(boil.DebugWriter, values)
	}

	if _, err = exec.Exec(updateQuery, values...); err != nil {
		return errors.Wrap(err, "failed to update local table")
	}

	o.WalletID = related.ID
	if o.R == nil {
		o.R = &paymentTemplateR{
			Wallet: related,
		}
	} else {
		o.R.Wallet = related
	}

	if related.R == nil {
		related.R = &userWalletR{
			WalletPaymentTemplates: PaymentTemplateSlice{o},
		}
	} else {
		related.R.WalletPaymentTemplates = append(related.R.WalletPaymentTemplates, o)
	}

	return nil
}

// PaymentTemplates retrieves all the records using an executor.
func PaymentTemplates(mods ...qm.QueryMod) paymentTemplateQuery {
	mods = append(mods, qm.From("\"payment_template\""))
	return paymentTemplateQuery{NewQuery(mods...)}
}

// FindPaymentTemplateG retrieves a single record by ID.
func FindPaymentTemplateG(iD int, selectCols ...string) (*PaymentTemplate, error) {
	return FindPaymentTemplate(boil.GetDB(), iD, selectCols...)
}

// FindPaymentTemplate retrieves a single record by ID with an executor.
// If selectCols is empty Find will return all columns.
func FindPaymentTemplate(exec boil.Executor, iD int, selectCols ...string) (*PaymentTemplate, error) {
	paymentTemplateObj := &PaymentTemplate{}

	sel := "*"
	if len(selectCols) > 0 {
		sel = strings.Join(strmangle.IdentQuoteSlice(dialect.LQ, dialect.RQ, selectCols), ",")
	}
	query := fmt.Sprintf(
		"select %s from \"payment_template\" where \"id\"=$1", sel,
	)

	q := queries.Raw(query, iD)

	err := q.Bind(nil, exec, paymentTemplateObj)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: unable to select from payment_template")
	}

	return paymentTemplateObj, nil
}

// InsertG a single record. See Insert for whitelist behavior description.
func (o *PaymentTemplate) InsertG(columns boil.Columns) error {
	return o.Insert(boil.GetDB(), columns)
}

// Insert a single record using an executor.
// See boil.Columns.InsertColumnSet documentation to understand column list inference for inserts.
func (o *PaymentTemplate) Insert(exec boil.Executor, columns boil.Columns) error {
	if o == nil {
		return errors.New("models: no payment_template provided for insertion")
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

	nzDefaults := queries.NonZeroDefaultSet(paymentTemplateColumnsWithDefault, o)

	key := makeCacheKey(columns, nzDefaults)
	paymentTemplateInsertCacheMut.RLock()
	cache, cached := paymentTemplateInsertCache[key]
	paymentTemplateInsertCacheMut.RUnlock()

	if !cached {
		wl, returnColumns := columns.InsertColumnSet(
			paymentTemplateColumns,
			paymentTemplateColumnsWithDefault,
			paymentTemplateColumnsWithoutDefault,
			nzDefaults,
		)

		cache.valueMapping, err = queries.BindMapping(paymentTemplateType, paymentTemplateMapping, wl)
		if err != nil {
			return err
		}
		cache.retMapping, err = queries.BindMapping(paymentTemplateType, paymentTemplateMapping, returnColumns)
		if err != nil {
			return err
		}
		if len(wl) != 0 {
			cache.query = fmt.Sprintf("INSERT INTO \"payment_template\" (\"%s\") %%sVALUES (%s)%%s", strings.Join(wl, "\",\""), strmangle.Placeholders(dialect.UseIndexPlaceholders, len(wl), 1, 1))
		} else {
			cache.query = "INSERT INTO \"payment_template\" %sDEFAULT VALUES%s"
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
		return errors.Wrap(err, "models: unable to insert into payment_template")
	}

	if !cached {
		paymentTemplateInsertCacheMut.Lock()
		paymentTemplateInsertCache[key] = cache
		paymentTemplateInsertCacheMut.Unlock()
	}

	return o.doAfterInsertHooks(exec)
}

// UpdateG a single PaymentTemplate record using the global executor.
// See Update for more documentation.
func (o *PaymentTemplate) UpdateG(columns boil.Columns) (int64, error) {
	return o.Update(boil.GetDB(), columns)
}

// Update uses an executor to update the PaymentTemplate.
// See boil.Columns.UpdateColumnSet documentation to understand column list inference for updates.
// Update does not automatically update the record in case of default values. Use .Reload() to refresh the records.
func (o *PaymentTemplate) Update(exec boil.Executor, columns boil.Columns) (int64, error) {
	currTime := time.Now().In(boil.GetLocation())

	o.UpdatedAt = currTime

	var err error
	if err = o.doBeforeUpdateHooks(exec); err != nil {
		return 0, err
	}
	key := makeCacheKey(columns, nil)
	paymentTemplateUpdateCacheMut.RLock()
	cache, cached := paymentTemplateUpdateCache[key]
	paymentTemplateUpdateCacheMut.RUnlock()

	if !cached {
		wl := columns.UpdateColumnSet(
			paymentTemplateColumns,
			paymentTemplatePrimaryKeyColumns,
		)

		if !columns.IsWhitelist() {
			wl = strmangle.SetComplement(wl, []string{"created_at"})
		}
		if len(wl) == 0 {
			return 0, errors.New("models: unable to update payment_template, could not build whitelist")
		}

		cache.query = fmt.Sprintf("UPDATE \"payment_template\" SET %s WHERE %s",
			strmangle.SetParamNames("\"", "\"", 1, wl),
			strmangle.WhereClause("\"", "\"", len(wl)+1, paymentTemplatePrimaryKeyColumns),
		)
		cache.valueMapping, err = queries.BindMapping(paymentTemplateType, paymentTemplateMapping, append(wl, paymentTemplatePrimaryKeyColumns...))
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
		return 0, errors.Wrap(err, "models: unable to update payment_template row")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by update for payment_template")
	}

	if !cached {
		paymentTemplateUpdateCacheMut.Lock()
		paymentTemplateUpdateCache[key] = cache
		paymentTemplateUpdateCacheMut.Unlock()
	}

	return rowsAff, o.doAfterUpdateHooks(exec)
}

// UpdateAll updates all rows with the specified column values.
func (q paymentTemplateQuery) UpdateAll(exec boil.Executor, cols M) (int64, error) {
	queries.SetUpdate(q.Query, cols)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all for payment_template")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected for payment_template")
	}

	return rowsAff, nil
}

// UpdateAllG updates all rows with the specified column values.
func (o PaymentTemplateSlice) UpdateAllG(cols M) (int64, error) {
	return o.UpdateAll(boil.GetDB(), cols)
}

// UpdateAll updates all rows with the specified column values, using an executor.
func (o PaymentTemplateSlice) UpdateAll(exec boil.Executor, cols M) (int64, error) {
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
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), paymentTemplatePrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := fmt.Sprintf("UPDATE \"payment_template\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, colNames),
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), len(colNames)+1, paymentTemplatePrimaryKeyColumns, len(o)))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all in paymentTemplate slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected all in update all paymentTemplate")
	}
	return rowsAff, nil
}

// UpsertG attempts an insert, and does an update or ignore on conflict.
func (o *PaymentTemplate) UpsertG(updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	return o.Upsert(boil.GetDB(), updateOnConflict, conflictColumns, updateColumns, insertColumns)
}

// Upsert attempts an insert using an executor, and does an update or ignore on conflict.
// See boil.Columns documentation for how to properly use updateColumns and insertColumns.
func (o *PaymentTemplate) Upsert(exec boil.Executor, updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	if o == nil {
		return errors.New("models: no payment_template provided for upsert")
	}
	currTime := time.Now().In(boil.GetLocation())

	if o.CreatedAt.IsZero() {
		o.CreatedAt = currTime
	}
	o.UpdatedAt = currTime

	if err := o.doBeforeUpsertHooks(exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(paymentTemplateColumnsWithDefault, o)

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

	paymentTemplateUpsertCacheMut.RLock()
	cache, cached := paymentTemplateUpsertCache[key]
	paymentTemplateUpsertCacheMut.RUnlock()

	var err error

	if !cached {
		insert, ret := insertColumns.InsertColumnSet(
			paymentTemplateColumns,
			paymentTemplateColumnsWithDefault,
			paymentTemplateColumnsWithoutDefault,
			nzDefaults,
		)
		update := updateColumns.UpdateColumnSet(
			paymentTemplateColumns,
			paymentTemplatePrimaryKeyColumns,
		)

		if len(update) == 0 {
			return errors.New("models: unable to upsert payment_template, could not build update column list")
		}

		conflict := conflictColumns
		if len(conflict) == 0 {
			conflict = make([]string, len(paymentTemplatePrimaryKeyColumns))
			copy(conflict, paymentTemplatePrimaryKeyColumns)
		}
		cache.query = buildUpsertQueryPostgres(dialect, "\"payment_template\"", updateOnConflict, ret, update, conflict, insert)

		cache.valueMapping, err = queries.BindMapping(paymentTemplateType, paymentTemplateMapping, insert)
		if err != nil {
			return err
		}
		if len(ret) != 0 {
			cache.retMapping, err = queries.BindMapping(paymentTemplateType, paymentTemplateMapping, ret)
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
		return errors.Wrap(err, "models: unable to upsert payment_template")
	}

	if !cached {
		paymentTemplateUpsertCacheMut.Lock()
		paymentTemplateUpsertCache[key] = cache
		paymentTemplateUpsertCacheMut.Unlock()
	}

	return o.doAfterUpsertHooks(exec)
}

// DeleteG deletes a single PaymentTemplate record.
// DeleteG will match against the primary key column to find the record to delete.
func (o *PaymentTemplate) DeleteG() (int64, error) {
	return o.Delete(boil.GetDB())
}

// Delete deletes a single PaymentTemplate record with an executor.
// Delete will match against the primary key column to find the record to delete.
func (o *PaymentTemplate) Delete(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no PaymentTemplate provided for delete")
	}

	if err := o.doBeforeDeleteHooks(exec); err != nil {
		return 0, err
	}

	args := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(o)), paymentTemplatePrimaryKeyMapping)
	sql := "DELETE FROM \"payment_template\" WHERE \"id\"=$1"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete from payment_template")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by delete for payment_template")
	}

	if err := o.doAfterDeleteHooks(exec); err != nil {
		return 0, err
	}

	return rowsAff, nil
}

// DeleteAll deletes all matching rows.
func (q paymentTemplateQuery) DeleteAll(exec boil.Executor) (int64, error) {
	if q.Query == nil {
		return 0, errors.New("models: no paymentTemplateQuery provided for delete all")
	}

	queries.SetDelete(q.Query)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from payment_template")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for payment_template")
	}

	return rowsAff, nil
}

// DeleteAllG deletes all rows in the slice.
func (o PaymentTemplateSlice) DeleteAllG() (int64, error) {
	return o.DeleteAll(boil.GetDB())
}

// DeleteAll deletes all rows in the slice, using an executor.
func (o PaymentTemplateSlice) DeleteAll(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no PaymentTemplate slice provided for delete all")
	}

	if len(o) == 0 {
		return 0, nil
	}

	if len(paymentTemplateBeforeDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doBeforeDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	var args []interface{}
	for _, obj := range o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), paymentTemplatePrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "DELETE FROM \"payment_template\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, paymentTemplatePrimaryKeyColumns, len(o))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from paymentTemplate slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for payment_template")
	}

	if len(paymentTemplateAfterDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	return rowsAff, nil
}

// ReloadG refetches the object from the database using the primary keys.
func (o *PaymentTemplate) ReloadG() error {
	if o == nil {
		return errors.New("models: no PaymentTemplate provided for reload")
	}

	return o.Reload(boil.GetDB())
}

// Reload refetches the object from the database
// using the primary keys with an executor.
func (o *PaymentTemplate) Reload(exec boil.Executor) error {
	ret, err := FindPaymentTemplate(exec, o.ID)
	if err != nil {
		return err
	}

	*o = *ret
	return nil
}

// ReloadAllG refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *PaymentTemplateSlice) ReloadAllG() error {
	if o == nil {
		return errors.New("models: empty PaymentTemplateSlice provided for reload all")
	}

	return o.ReloadAll(boil.GetDB())
}

// ReloadAll refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *PaymentTemplateSlice) ReloadAll(exec boil.Executor) error {
	if o == nil || len(*o) == 0 {
		return nil
	}

	slice := PaymentTemplateSlice{}
	var args []interface{}
	for _, obj := range *o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), paymentTemplatePrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "SELECT \"payment_template\".* FROM \"payment_template\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, paymentTemplatePrimaryKeyColumns, len(*o))

	q := queries.Raw(sql, args...)

	err := q.Bind(nil, exec, &slice)
	if err != nil {
		return errors.Wrap(err, "models: unable to reload all in PaymentTemplateSlice")
	}

	*o = slice

	return nil
}

// PaymentTemplateExistsG checks if the PaymentTemplate row exists.
func PaymentTemplateExistsG(iD int) (bool, error) {
	return PaymentTemplateExists(boil.GetDB(), iD)
}

// PaymentTemplateExists checks if the PaymentTemplate row exists.
func PaymentTemplateExists(exec boil.Executor, iD int) (bool, error) {
	var exists bool
	sql := "select exists(select 1 from \"payment_template\" where \"id\"=$1 limit 1)"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, iD)
	}

	row := exec.QueryRow(sql, iD)

	err := row.Scan(&exists)
	if err != nil {
		return false, errors.Wrap(err, "models: unable to check if payment_template exists")
	}

	return exists, nil
}

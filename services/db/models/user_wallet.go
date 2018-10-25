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

// UserWallet is an object representing the database table.
type UserWallet struct {
	ID               int       `boil:"id" json:"id" toml:"id" yaml:"id"`
	UserID           int       `boil:"user_id" json:"user_id" toml:"user_id" yaml:"user_id"`
	PublicKey        string    `boil:"public_key" json:"public_key" toml:"public_key" yaml:"public_key"`
	WalletName       string    `boil:"wallet_name" json:"wallet_name" toml:"wallet_name" yaml:"wallet_name"`
	FriendlyID       string    `boil:"friendly_id" json:"friendly_id" toml:"friendly_id" yaml:"friendly_id"`
	Domain           string    `boil:"domain" json:"domain" toml:"domain" yaml:"domain"`
	ShowOnHomescreen bool      `boil:"show_on_homescreen" json:"show_on_homescreen" toml:"show_on_homescreen" yaml:"show_on_homescreen"`
	CreatedAt        time.Time `boil:"created_at" json:"created_at" toml:"created_at" yaml:"created_at"`
	UpdatedAt        time.Time `boil:"updated_at" json:"updated_at" toml:"updated_at" yaml:"updated_at"`
	UpdatedBy        string    `boil:"updated_by" json:"updated_by" toml:"updated_by" yaml:"updated_by"`
	OrderNR          int       `boil:"order_nr" json:"order_nr" toml:"order_nr" yaml:"order_nr"`
	WalletType       string    `boil:"wallet_type" json:"wallet_type" toml:"wallet_type" yaml:"wallet_type"`

	R *userWalletR `boil:"-" json:"-" toml:"-" yaml:"-"`
	L userWalletL  `boil:"-" json:"-" toml:"-" yaml:"-"`
}

var UserWalletColumns = struct {
	ID               string
	UserID           string
	PublicKey        string
	WalletName       string
	FriendlyID       string
	Domain           string
	ShowOnHomescreen string
	CreatedAt        string
	UpdatedAt        string
	UpdatedBy        string
	OrderNR          string
	WalletType       string
}{
	ID:               "id",
	UserID:           "user_id",
	PublicKey:        "public_key",
	WalletName:       "wallet_name",
	FriendlyID:       "friendly_id",
	Domain:           "domain",
	ShowOnHomescreen: "show_on_homescreen",
	CreatedAt:        "created_at",
	UpdatedAt:        "updated_at",
	UpdatedBy:        "updated_by",
	OrderNR:          "order_nr",
	WalletType:       "wallet_type",
}

// UserWalletRels is where relationship names are stored.
var UserWalletRels = struct {
	User                   string
	WalletPaymentTemplates string
}{
	User: "User",
	WalletPaymentTemplates: "WalletPaymentTemplates",
}

// userWalletR is where relationships are stored.
type userWalletR struct {
	User                   *UserProfile
	WalletPaymentTemplates PaymentTemplateSlice
}

// NewStruct creates a new relationship struct
func (*userWalletR) NewStruct() *userWalletR {
	return &userWalletR{}
}

// userWalletL is where Load methods for each relationship are stored.
type userWalletL struct{}

var (
	userWalletColumns               = []string{"id", "user_id", "public_key", "wallet_name", "friendly_id", "domain", "show_on_homescreen", "created_at", "updated_at", "updated_by", "order_nr", "wallet_type"}
	userWalletColumnsWithoutDefault = []string{"user_id", "public_key", "wallet_name", "updated_by"}
	userWalletColumnsWithDefault    = []string{"id", "friendly_id", "domain", "show_on_homescreen", "created_at", "updated_at", "order_nr", "wallet_type"}
	userWalletPrimaryKeyColumns     = []string{"id"}
)

type (
	// UserWalletSlice is an alias for a slice of pointers to UserWallet.
	// This should generally be used opposed to []UserWallet.
	UserWalletSlice []*UserWallet
	// UserWalletHook is the signature for custom UserWallet hook methods
	UserWalletHook func(boil.Executor, *UserWallet) error

	userWalletQuery struct {
		*queries.Query
	}
)

// Cache for insert, update and upsert
var (
	userWalletType                 = reflect.TypeOf(&UserWallet{})
	userWalletMapping              = queries.MakeStructMapping(userWalletType)
	userWalletPrimaryKeyMapping, _ = queries.BindMapping(userWalletType, userWalletMapping, userWalletPrimaryKeyColumns)
	userWalletInsertCacheMut       sync.RWMutex
	userWalletInsertCache          = make(map[string]insertCache)
	userWalletUpdateCacheMut       sync.RWMutex
	userWalletUpdateCache          = make(map[string]updateCache)
	userWalletUpsertCacheMut       sync.RWMutex
	userWalletUpsertCache          = make(map[string]insertCache)
)

var (
	// Force time package dependency for automated UpdatedAt/CreatedAt.
	_ = time.Second
)

var userWalletBeforeInsertHooks []UserWalletHook
var userWalletBeforeUpdateHooks []UserWalletHook
var userWalletBeforeDeleteHooks []UserWalletHook
var userWalletBeforeUpsertHooks []UserWalletHook

var userWalletAfterInsertHooks []UserWalletHook
var userWalletAfterSelectHooks []UserWalletHook
var userWalletAfterUpdateHooks []UserWalletHook
var userWalletAfterDeleteHooks []UserWalletHook
var userWalletAfterUpsertHooks []UserWalletHook

// doBeforeInsertHooks executes all "before insert" hooks.
func (o *UserWallet) doBeforeInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletBeforeInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpdateHooks executes all "before Update" hooks.
func (o *UserWallet) doBeforeUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletBeforeUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeDeleteHooks executes all "before Delete" hooks.
func (o *UserWallet) doBeforeDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletBeforeDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doBeforeUpsertHooks executes all "before Upsert" hooks.
func (o *UserWallet) doBeforeUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletBeforeUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterInsertHooks executes all "after Insert" hooks.
func (o *UserWallet) doAfterInsertHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletAfterInsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterSelectHooks executes all "after Select" hooks.
func (o *UserWallet) doAfterSelectHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletAfterSelectHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpdateHooks executes all "after Update" hooks.
func (o *UserWallet) doAfterUpdateHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletAfterUpdateHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterDeleteHooks executes all "after Delete" hooks.
func (o *UserWallet) doAfterDeleteHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletAfterDeleteHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// doAfterUpsertHooks executes all "after Upsert" hooks.
func (o *UserWallet) doAfterUpsertHooks(exec boil.Executor) (err error) {
	for _, hook := range userWalletAfterUpsertHooks {
		if err := hook(exec, o); err != nil {
			return err
		}
	}

	return nil
}

// AddUserWalletHook registers your hook function for all future operations.
func AddUserWalletHook(hookPoint boil.HookPoint, userWalletHook UserWalletHook) {
	switch hookPoint {
	case boil.BeforeInsertHook:
		userWalletBeforeInsertHooks = append(userWalletBeforeInsertHooks, userWalletHook)
	case boil.BeforeUpdateHook:
		userWalletBeforeUpdateHooks = append(userWalletBeforeUpdateHooks, userWalletHook)
	case boil.BeforeDeleteHook:
		userWalletBeforeDeleteHooks = append(userWalletBeforeDeleteHooks, userWalletHook)
	case boil.BeforeUpsertHook:
		userWalletBeforeUpsertHooks = append(userWalletBeforeUpsertHooks, userWalletHook)
	case boil.AfterInsertHook:
		userWalletAfterInsertHooks = append(userWalletAfterInsertHooks, userWalletHook)
	case boil.AfterSelectHook:
		userWalletAfterSelectHooks = append(userWalletAfterSelectHooks, userWalletHook)
	case boil.AfterUpdateHook:
		userWalletAfterUpdateHooks = append(userWalletAfterUpdateHooks, userWalletHook)
	case boil.AfterDeleteHook:
		userWalletAfterDeleteHooks = append(userWalletAfterDeleteHooks, userWalletHook)
	case boil.AfterUpsertHook:
		userWalletAfterUpsertHooks = append(userWalletAfterUpsertHooks, userWalletHook)
	}
}

// OneG returns a single userWallet record from the query using the global executor.
func (q userWalletQuery) OneG() (*UserWallet, error) {
	return q.One(boil.GetDB())
}

// One returns a single userWallet record from the query.
func (q userWalletQuery) One(exec boil.Executor) (*UserWallet, error) {
	o := &UserWallet{}

	queries.SetLimit(q.Query, 1)

	err := q.Bind(nil, exec, o)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: failed to execute a one query for user_wallet")
	}

	if err := o.doAfterSelectHooks(exec); err != nil {
		return o, err
	}

	return o, nil
}

// AllG returns all UserWallet records from the query using the global executor.
func (q userWalletQuery) AllG() (UserWalletSlice, error) {
	return q.All(boil.GetDB())
}

// All returns all UserWallet records from the query.
func (q userWalletQuery) All(exec boil.Executor) (UserWalletSlice, error) {
	var o []*UserWallet

	err := q.Bind(nil, exec, &o)
	if err != nil {
		return nil, errors.Wrap(err, "models: failed to assign all query results to UserWallet slice")
	}

	if len(userWalletAfterSelectHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterSelectHooks(exec); err != nil {
				return o, err
			}
		}
	}

	return o, nil
}

// CountG returns the count of all UserWallet records in the query, and panics on error.
func (q userWalletQuery) CountG() (int64, error) {
	return q.Count(boil.GetDB())
}

// Count returns the count of all UserWallet records in the query.
func (q userWalletQuery) Count(exec boil.Executor) (int64, error) {
	var count int64

	queries.SetSelect(q.Query, nil)
	queries.SetCount(q.Query)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to count user_wallet rows")
	}

	return count, nil
}

// ExistsG checks if the row exists in the table, and panics on error.
func (q userWalletQuery) ExistsG() (bool, error) {
	return q.Exists(boil.GetDB())
}

// Exists checks if the row exists in the table.
func (q userWalletQuery) Exists(exec boil.Executor) (bool, error) {
	var count int64

	queries.SetCount(q.Query)
	queries.SetLimit(q.Query, 1)

	err := q.Query.QueryRow(exec).Scan(&count)
	if err != nil {
		return false, errors.Wrap(err, "models: failed to check if user_wallet exists")
	}

	return count > 0, nil
}

// User pointed to by the foreign key.
func (o *UserWallet) User(mods ...qm.QueryMod) userProfileQuery {
	queryMods := []qm.QueryMod{
		qm.Where("id=?", o.UserID),
	}

	queryMods = append(queryMods, mods...)

	query := UserProfiles(queryMods...)
	queries.SetFrom(query.Query, "\"user_profile\"")

	return query
}

// WalletPaymentTemplates retrieves all the payment_template's PaymentTemplates with an executor via wallet_id column.
func (o *UserWallet) WalletPaymentTemplates(mods ...qm.QueryMod) paymentTemplateQuery {
	var queryMods []qm.QueryMod
	if len(mods) != 0 {
		queryMods = append(queryMods, mods...)
	}

	queryMods = append(queryMods,
		qm.Where("\"payment_template\".\"wallet_id\"=?", o.ID),
	)

	query := PaymentTemplates(queryMods...)
	queries.SetFrom(query.Query, "\"payment_template\"")

	if len(queries.GetSelect(query.Query)) == 0 {
		queries.SetSelect(query.Query, []string{"\"payment_template\".*"})
	}

	return query
}

// LoadUser allows an eager lookup of values, cached into the
// loaded structs of the objects. This is for an N-1 relationship.
func (userWalletL) LoadUser(e boil.Executor, singular bool, maybeUserWallet interface{}, mods queries.Applicator) error {
	var slice []*UserWallet
	var object *UserWallet

	if singular {
		object = maybeUserWallet.(*UserWallet)
	} else {
		slice = *maybeUserWallet.(*[]*UserWallet)
	}

	args := make([]interface{}, 0, 1)
	if singular {
		if object.R == nil {
			object.R = &userWalletR{}
		}
		args = append(args, object.UserID)
	} else {
	Outer:
		for _, obj := range slice {
			if obj.R == nil {
				obj.R = &userWalletR{}
			}

			for _, a := range args {
				if a == obj.UserID {
					continue Outer
				}
			}

			args = append(args, obj.UserID)
		}
	}

	query := NewQuery(qm.From(`user_profile`), qm.WhereIn(`id in ?`, args...))
	if mods != nil {
		mods.Apply(query)
	}

	results, err := query.Query(e)
	if err != nil {
		return errors.Wrap(err, "failed to eager load UserProfile")
	}

	var resultSlice []*UserProfile
	if err = queries.Bind(results, &resultSlice); err != nil {
		return errors.Wrap(err, "failed to bind eager loaded slice UserProfile")
	}

	if err = results.Close(); err != nil {
		return errors.Wrap(err, "failed to close results of eager load for user_profile")
	}
	if err = results.Err(); err != nil {
		return errors.Wrap(err, "error occurred during iteration of eager loaded relations for user_profile")
	}

	if len(userWalletAfterSelectHooks) != 0 {
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
		object.R.User = foreign
		if foreign.R == nil {
			foreign.R = &userProfileR{}
		}
		foreign.R.UserUserWallets = append(foreign.R.UserUserWallets, object)
		return nil
	}

	for _, local := range slice {
		for _, foreign := range resultSlice {
			if local.UserID == foreign.ID {
				local.R.User = foreign
				if foreign.R == nil {
					foreign.R = &userProfileR{}
				}
				foreign.R.UserUserWallets = append(foreign.R.UserUserWallets, local)
				break
			}
		}
	}

	return nil
}

// LoadWalletPaymentTemplates allows an eager lookup of values, cached into the
// loaded structs of the objects. This is for a 1-M or N-M relationship.
func (userWalletL) LoadWalletPaymentTemplates(e boil.Executor, singular bool, maybeUserWallet interface{}, mods queries.Applicator) error {
	var slice []*UserWallet
	var object *UserWallet

	if singular {
		object = maybeUserWallet.(*UserWallet)
	} else {
		slice = *maybeUserWallet.(*[]*UserWallet)
	}

	args := make([]interface{}, 0, 1)
	if singular {
		if object.R == nil {
			object.R = &userWalletR{}
		}
		args = append(args, object.ID)
	} else {
	Outer:
		for _, obj := range slice {
			if obj.R == nil {
				obj.R = &userWalletR{}
			}

			for _, a := range args {
				if a == obj.ID {
					continue Outer
				}
			}

			args = append(args, obj.ID)
		}
	}

	query := NewQuery(qm.From(`payment_template`), qm.WhereIn(`wallet_id in ?`, args...))
	if mods != nil {
		mods.Apply(query)
	}

	results, err := query.Query(e)
	if err != nil {
		return errors.Wrap(err, "failed to eager load payment_template")
	}

	var resultSlice []*PaymentTemplate
	if err = queries.Bind(results, &resultSlice); err != nil {
		return errors.Wrap(err, "failed to bind eager loaded slice payment_template")
	}

	if err = results.Close(); err != nil {
		return errors.Wrap(err, "failed to close results in eager load on payment_template")
	}
	if err = results.Err(); err != nil {
		return errors.Wrap(err, "error occurred during iteration of eager loaded relations for payment_template")
	}

	if len(paymentTemplateAfterSelectHooks) != 0 {
		for _, obj := range resultSlice {
			if err := obj.doAfterSelectHooks(e); err != nil {
				return err
			}
		}
	}
	if singular {
		object.R.WalletPaymentTemplates = resultSlice
		for _, foreign := range resultSlice {
			if foreign.R == nil {
				foreign.R = &paymentTemplateR{}
			}
			foreign.R.Wallet = object
		}
		return nil
	}

	for _, foreign := range resultSlice {
		for _, local := range slice {
			if local.ID == foreign.WalletID {
				local.R.WalletPaymentTemplates = append(local.R.WalletPaymentTemplates, foreign)
				if foreign.R == nil {
					foreign.R = &paymentTemplateR{}
				}
				foreign.R.Wallet = local
				break
			}
		}
	}

	return nil
}

// SetUserG of the userWallet to the related item.
// Sets o.R.User to related.
// Adds o to related.R.UserUserWallets.
// Uses the global database handle.
func (o *UserWallet) SetUserG(insert bool, related *UserProfile) error {
	return o.SetUser(boil.GetDB(), insert, related)
}

// SetUser of the userWallet to the related item.
// Sets o.R.User to related.
// Adds o to related.R.UserUserWallets.
func (o *UserWallet) SetUser(exec boil.Executor, insert bool, related *UserProfile) error {
	var err error
	if insert {
		if err = related.Insert(exec, boil.Infer()); err != nil {
			return errors.Wrap(err, "failed to insert into foreign table")
		}
	}

	updateQuery := fmt.Sprintf(
		"UPDATE \"user_wallet\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, []string{"user_id"}),
		strmangle.WhereClause("\"", "\"", 2, userWalletPrimaryKeyColumns),
	)
	values := []interface{}{related.ID, o.ID}

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, updateQuery)
		fmt.Fprintln(boil.DebugWriter, values)
	}

	if _, err = exec.Exec(updateQuery, values...); err != nil {
		return errors.Wrap(err, "failed to update local table")
	}

	o.UserID = related.ID
	if o.R == nil {
		o.R = &userWalletR{
			User: related,
		}
	} else {
		o.R.User = related
	}

	if related.R == nil {
		related.R = &userProfileR{
			UserUserWallets: UserWalletSlice{o},
		}
	} else {
		related.R.UserUserWallets = append(related.R.UserUserWallets, o)
	}

	return nil
}

// AddWalletPaymentTemplatesG adds the given related objects to the existing relationships
// of the user_wallet, optionally inserting them as new records.
// Appends related to o.R.WalletPaymentTemplates.
// Sets related.R.Wallet appropriately.
// Uses the global database handle.
func (o *UserWallet) AddWalletPaymentTemplatesG(insert bool, related ...*PaymentTemplate) error {
	return o.AddWalletPaymentTemplates(boil.GetDB(), insert, related...)
}

// AddWalletPaymentTemplates adds the given related objects to the existing relationships
// of the user_wallet, optionally inserting them as new records.
// Appends related to o.R.WalletPaymentTemplates.
// Sets related.R.Wallet appropriately.
func (o *UserWallet) AddWalletPaymentTemplates(exec boil.Executor, insert bool, related ...*PaymentTemplate) error {
	var err error
	for _, rel := range related {
		if insert {
			rel.WalletID = o.ID
			if err = rel.Insert(exec, boil.Infer()); err != nil {
				return errors.Wrap(err, "failed to insert into foreign table")
			}
		} else {
			updateQuery := fmt.Sprintf(
				"UPDATE \"payment_template\" SET %s WHERE %s",
				strmangle.SetParamNames("\"", "\"", 1, []string{"wallet_id"}),
				strmangle.WhereClause("\"", "\"", 2, paymentTemplatePrimaryKeyColumns),
			)
			values := []interface{}{o.ID, rel.ID}

			if boil.DebugMode {
				fmt.Fprintln(boil.DebugWriter, updateQuery)
				fmt.Fprintln(boil.DebugWriter, values)
			}

			if _, err = exec.Exec(updateQuery, values...); err != nil {
				return errors.Wrap(err, "failed to update foreign table")
			}

			rel.WalletID = o.ID
		}
	}

	if o.R == nil {
		o.R = &userWalletR{
			WalletPaymentTemplates: related,
		}
	} else {
		o.R.WalletPaymentTemplates = append(o.R.WalletPaymentTemplates, related...)
	}

	for _, rel := range related {
		if rel.R == nil {
			rel.R = &paymentTemplateR{
				Wallet: o,
			}
		} else {
			rel.R.Wallet = o
		}
	}
	return nil
}

// UserWallets retrieves all the records using an executor.
func UserWallets(mods ...qm.QueryMod) userWalletQuery {
	mods = append(mods, qm.From("\"user_wallet\""))
	return userWalletQuery{NewQuery(mods...)}
}

// FindUserWalletG retrieves a single record by ID.
func FindUserWalletG(iD int, selectCols ...string) (*UserWallet, error) {
	return FindUserWallet(boil.GetDB(), iD, selectCols...)
}

// FindUserWallet retrieves a single record by ID with an executor.
// If selectCols is empty Find will return all columns.
func FindUserWallet(exec boil.Executor, iD int, selectCols ...string) (*UserWallet, error) {
	userWalletObj := &UserWallet{}

	sel := "*"
	if len(selectCols) > 0 {
		sel = strings.Join(strmangle.IdentQuoteSlice(dialect.LQ, dialect.RQ, selectCols), ",")
	}
	query := fmt.Sprintf(
		"select %s from \"user_wallet\" where \"id\"=$1", sel,
	)

	q := queries.Raw(query, iD)

	err := q.Bind(nil, exec, userWalletObj)
	if err != nil {
		if errors.Cause(err) == sql.ErrNoRows {
			return nil, sql.ErrNoRows
		}
		return nil, errors.Wrap(err, "models: unable to select from user_wallet")
	}

	return userWalletObj, nil
}

// InsertG a single record. See Insert for whitelist behavior description.
func (o *UserWallet) InsertG(columns boil.Columns) error {
	return o.Insert(boil.GetDB(), columns)
}

// Insert a single record using an executor.
// See boil.Columns.InsertColumnSet documentation to understand column list inference for inserts.
func (o *UserWallet) Insert(exec boil.Executor, columns boil.Columns) error {
	if o == nil {
		return errors.New("models: no user_wallet provided for insertion")
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

	nzDefaults := queries.NonZeroDefaultSet(userWalletColumnsWithDefault, o)

	key := makeCacheKey(columns, nzDefaults)
	userWalletInsertCacheMut.RLock()
	cache, cached := userWalletInsertCache[key]
	userWalletInsertCacheMut.RUnlock()

	if !cached {
		wl, returnColumns := columns.InsertColumnSet(
			userWalletColumns,
			userWalletColumnsWithDefault,
			userWalletColumnsWithoutDefault,
			nzDefaults,
		)

		cache.valueMapping, err = queries.BindMapping(userWalletType, userWalletMapping, wl)
		if err != nil {
			return err
		}
		cache.retMapping, err = queries.BindMapping(userWalletType, userWalletMapping, returnColumns)
		if err != nil {
			return err
		}
		if len(wl) != 0 {
			cache.query = fmt.Sprintf("INSERT INTO \"user_wallet\" (\"%s\") %%sVALUES (%s)%%s", strings.Join(wl, "\",\""), strmangle.Placeholders(dialect.UseIndexPlaceholders, len(wl), 1, 1))
		} else {
			cache.query = "INSERT INTO \"user_wallet\" %sDEFAULT VALUES%s"
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
		return errors.Wrap(err, "models: unable to insert into user_wallet")
	}

	if !cached {
		userWalletInsertCacheMut.Lock()
		userWalletInsertCache[key] = cache
		userWalletInsertCacheMut.Unlock()
	}

	return o.doAfterInsertHooks(exec)
}

// UpdateG a single UserWallet record using the global executor.
// See Update for more documentation.
func (o *UserWallet) UpdateG(columns boil.Columns) (int64, error) {
	return o.Update(boil.GetDB(), columns)
}

// Update uses an executor to update the UserWallet.
// See boil.Columns.UpdateColumnSet documentation to understand column list inference for updates.
// Update does not automatically update the record in case of default values. Use .Reload() to refresh the records.
func (o *UserWallet) Update(exec boil.Executor, columns boil.Columns) (int64, error) {
	currTime := time.Now().In(boil.GetLocation())

	o.UpdatedAt = currTime

	var err error
	if err = o.doBeforeUpdateHooks(exec); err != nil {
		return 0, err
	}
	key := makeCacheKey(columns, nil)
	userWalletUpdateCacheMut.RLock()
	cache, cached := userWalletUpdateCache[key]
	userWalletUpdateCacheMut.RUnlock()

	if !cached {
		wl := columns.UpdateColumnSet(
			userWalletColumns,
			userWalletPrimaryKeyColumns,
		)

		if !columns.IsWhitelist() {
			wl = strmangle.SetComplement(wl, []string{"created_at"})
		}
		if len(wl) == 0 {
			return 0, errors.New("models: unable to update user_wallet, could not build whitelist")
		}

		cache.query = fmt.Sprintf("UPDATE \"user_wallet\" SET %s WHERE %s",
			strmangle.SetParamNames("\"", "\"", 1, wl),
			strmangle.WhereClause("\"", "\"", len(wl)+1, userWalletPrimaryKeyColumns),
		)
		cache.valueMapping, err = queries.BindMapping(userWalletType, userWalletMapping, append(wl, userWalletPrimaryKeyColumns...))
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
		return 0, errors.Wrap(err, "models: unable to update user_wallet row")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by update for user_wallet")
	}

	if !cached {
		userWalletUpdateCacheMut.Lock()
		userWalletUpdateCache[key] = cache
		userWalletUpdateCacheMut.Unlock()
	}

	return rowsAff, o.doAfterUpdateHooks(exec)
}

// UpdateAll updates all rows with the specified column values.
func (q userWalletQuery) UpdateAll(exec boil.Executor, cols M) (int64, error) {
	queries.SetUpdate(q.Query, cols)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all for user_wallet")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected for user_wallet")
	}

	return rowsAff, nil
}

// UpdateAllG updates all rows with the specified column values.
func (o UserWalletSlice) UpdateAllG(cols M) (int64, error) {
	return o.UpdateAll(boil.GetDB(), cols)
}

// UpdateAll updates all rows with the specified column values, using an executor.
func (o UserWalletSlice) UpdateAll(exec boil.Executor, cols M) (int64, error) {
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
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), userWalletPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := fmt.Sprintf("UPDATE \"user_wallet\" SET %s WHERE %s",
		strmangle.SetParamNames("\"", "\"", 1, colNames),
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), len(colNames)+1, userWalletPrimaryKeyColumns, len(o)))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to update all in userWallet slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to retrieve rows affected all in update all userWallet")
	}
	return rowsAff, nil
}

// UpsertG attempts an insert, and does an update or ignore on conflict.
func (o *UserWallet) UpsertG(updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	return o.Upsert(boil.GetDB(), updateOnConflict, conflictColumns, updateColumns, insertColumns)
}

// Upsert attempts an insert using an executor, and does an update or ignore on conflict.
// See boil.Columns documentation for how to properly use updateColumns and insertColumns.
func (o *UserWallet) Upsert(exec boil.Executor, updateOnConflict bool, conflictColumns []string, updateColumns, insertColumns boil.Columns) error {
	if o == nil {
		return errors.New("models: no user_wallet provided for upsert")
	}
	currTime := time.Now().In(boil.GetLocation())

	if o.CreatedAt.IsZero() {
		o.CreatedAt = currTime
	}
	o.UpdatedAt = currTime

	if err := o.doBeforeUpsertHooks(exec); err != nil {
		return err
	}

	nzDefaults := queries.NonZeroDefaultSet(userWalletColumnsWithDefault, o)

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

	userWalletUpsertCacheMut.RLock()
	cache, cached := userWalletUpsertCache[key]
	userWalletUpsertCacheMut.RUnlock()

	var err error

	if !cached {
		insert, ret := insertColumns.InsertColumnSet(
			userWalletColumns,
			userWalletColumnsWithDefault,
			userWalletColumnsWithoutDefault,
			nzDefaults,
		)
		update := updateColumns.UpdateColumnSet(
			userWalletColumns,
			userWalletPrimaryKeyColumns,
		)

		if len(update) == 0 {
			return errors.New("models: unable to upsert user_wallet, could not build update column list")
		}

		conflict := conflictColumns
		if len(conflict) == 0 {
			conflict = make([]string, len(userWalletPrimaryKeyColumns))
			copy(conflict, userWalletPrimaryKeyColumns)
		}
		cache.query = buildUpsertQueryPostgres(dialect, "\"user_wallet\"", updateOnConflict, ret, update, conflict, insert)

		cache.valueMapping, err = queries.BindMapping(userWalletType, userWalletMapping, insert)
		if err != nil {
			return err
		}
		if len(ret) != 0 {
			cache.retMapping, err = queries.BindMapping(userWalletType, userWalletMapping, ret)
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
		return errors.Wrap(err, "models: unable to upsert user_wallet")
	}

	if !cached {
		userWalletUpsertCacheMut.Lock()
		userWalletUpsertCache[key] = cache
		userWalletUpsertCacheMut.Unlock()
	}

	return o.doAfterUpsertHooks(exec)
}

// DeleteG deletes a single UserWallet record.
// DeleteG will match against the primary key column to find the record to delete.
func (o *UserWallet) DeleteG() (int64, error) {
	return o.Delete(boil.GetDB())
}

// Delete deletes a single UserWallet record with an executor.
// Delete will match against the primary key column to find the record to delete.
func (o *UserWallet) Delete(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no UserWallet provided for delete")
	}

	if err := o.doBeforeDeleteHooks(exec); err != nil {
		return 0, err
	}

	args := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(o)), userWalletPrimaryKeyMapping)
	sql := "DELETE FROM \"user_wallet\" WHERE \"id\"=$1"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args...)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete from user_wallet")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by delete for user_wallet")
	}

	if err := o.doAfterDeleteHooks(exec); err != nil {
		return 0, err
	}

	return rowsAff, nil
}

// DeleteAll deletes all matching rows.
func (q userWalletQuery) DeleteAll(exec boil.Executor) (int64, error) {
	if q.Query == nil {
		return 0, errors.New("models: no userWalletQuery provided for delete all")
	}

	queries.SetDelete(q.Query)

	result, err := q.Query.Exec(exec)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from user_wallet")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for user_wallet")
	}

	return rowsAff, nil
}

// DeleteAllG deletes all rows in the slice.
func (o UserWalletSlice) DeleteAllG() (int64, error) {
	return o.DeleteAll(boil.GetDB())
}

// DeleteAll deletes all rows in the slice, using an executor.
func (o UserWalletSlice) DeleteAll(exec boil.Executor) (int64, error) {
	if o == nil {
		return 0, errors.New("models: no UserWallet slice provided for delete all")
	}

	if len(o) == 0 {
		return 0, nil
	}

	if len(userWalletBeforeDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doBeforeDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	var args []interface{}
	for _, obj := range o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), userWalletPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "DELETE FROM \"user_wallet\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, userWalletPrimaryKeyColumns, len(o))

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, args)
	}

	result, err := exec.Exec(sql, args...)
	if err != nil {
		return 0, errors.Wrap(err, "models: unable to delete all from userWallet slice")
	}

	rowsAff, err := result.RowsAffected()
	if err != nil {
		return 0, errors.Wrap(err, "models: failed to get rows affected by deleteall for user_wallet")
	}

	if len(userWalletAfterDeleteHooks) != 0 {
		for _, obj := range o {
			if err := obj.doAfterDeleteHooks(exec); err != nil {
				return 0, err
			}
		}
	}

	return rowsAff, nil
}

// ReloadG refetches the object from the database using the primary keys.
func (o *UserWallet) ReloadG() error {
	if o == nil {
		return errors.New("models: no UserWallet provided for reload")
	}

	return o.Reload(boil.GetDB())
}

// Reload refetches the object from the database
// using the primary keys with an executor.
func (o *UserWallet) Reload(exec boil.Executor) error {
	ret, err := FindUserWallet(exec, o.ID)
	if err != nil {
		return err
	}

	*o = *ret
	return nil
}

// ReloadAllG refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *UserWalletSlice) ReloadAllG() error {
	if o == nil {
		return errors.New("models: empty UserWalletSlice provided for reload all")
	}

	return o.ReloadAll(boil.GetDB())
}

// ReloadAll refetches every row with matching primary key column values
// and overwrites the original object slice with the newly updated slice.
func (o *UserWalletSlice) ReloadAll(exec boil.Executor) error {
	if o == nil || len(*o) == 0 {
		return nil
	}

	slice := UserWalletSlice{}
	var args []interface{}
	for _, obj := range *o {
		pkeyArgs := queries.ValuesFromMapping(reflect.Indirect(reflect.ValueOf(obj)), userWalletPrimaryKeyMapping)
		args = append(args, pkeyArgs...)
	}

	sql := "SELECT \"user_wallet\".* FROM \"user_wallet\" WHERE " +
		strmangle.WhereClauseRepeated(string(dialect.LQ), string(dialect.RQ), 1, userWalletPrimaryKeyColumns, len(*o))

	q := queries.Raw(sql, args...)

	err := q.Bind(nil, exec, &slice)
	if err != nil {
		return errors.Wrap(err, "models: unable to reload all in UserWalletSlice")
	}

	*o = slice

	return nil
}

// UserWalletExistsG checks if the UserWallet row exists.
func UserWalletExistsG(iD int) (bool, error) {
	return UserWalletExists(boil.GetDB(), iD)
}

// UserWalletExists checks if the UserWallet row exists.
func UserWalletExists(exec boil.Executor, iD int) (bool, error) {
	var exists bool
	sql := "select exists(select 1 from \"user_wallet\" where \"id\"=$1 limit 1)"

	if boil.DebugMode {
		fmt.Fprintln(boil.DebugWriter, sql)
		fmt.Fprintln(boil.DebugWriter, iD)
	}

	row := exec.QueryRow(sql, iD)

	err := row.Scan(&exists)
	if err != nil {
		return false, errors.Wrap(err, "models: unable to check if user_wallet exists")
	}

	return exists, nil
}

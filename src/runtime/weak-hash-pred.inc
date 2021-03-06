static int survived_gc_yet_KEY(lispobj key, lispobj value) {
    return !is_lisp_pointer(key) || pointer_survived_gc_yet(key);
}
static int survived_gc_yet_VALUE(lispobj key, lispobj value) {
    return !is_lisp_pointer(value) || pointer_survived_gc_yet(value);
}
static int survived_gc_yet_AND(lispobj key, lispobj value) {
    int key_nonpointer = !is_lisp_pointer(key);
    int val_nonpointer = !is_lisp_pointer(value);
    if (key_nonpointer && val_nonpointer) return 1;
    return (key_nonpointer || pointer_survived_gc_yet(key))
        && (val_nonpointer || pointer_survived_gc_yet(value));
}
static int survived_gc_yet_OR(lispobj key, lispobj value) {
    int key_nonpointer = !is_lisp_pointer(key);
    int val_nonpointer = !is_lisp_pointer(value);
    if (key_nonpointer || val_nonpointer) return 1;
    // Both MUST be pointers
    return pointer_survived_gc_yet(key) || pointer_survived_gc_yet(value);
}

int (*HT_ENTRY_LIVENESS_FUN_ARRAY_NAME[5])(lispobj,lispobj) = {
    NULL,
    survived_gc_yet_KEY,
    survived_gc_yet_VALUE,
    survived_gc_yet_AND,
    survived_gc_yet_OR
};

def run_DML_OF(Y, T, X, W, X_test):

    est = DMLOrthoForest(
        n_trees=1000,
        min_leaf_size=5,
        max_depth=50,
        subsample_ratio=subsample_ratio,
        model_T=Lasso(alpha=lambda_reg),
        model_Y=Lasso(alpha=lambda_reg),
        model_T_final=WeightedLasso(alpha=lambda_reg),
        model_Y_final=WeightedLasso(alpha=lambda_reg),
        global_residualization=False,
        random_state=123,
    )

    est.fit(Y, T, X=X, W=W, inference="blb")
    treatment_effects = est.effect(X_test)
    te_lower, te_upper = est.effect_interval(X_test)
    return treatment_effects, te_lower, te_upper

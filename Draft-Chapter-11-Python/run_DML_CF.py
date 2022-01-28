def run_DML_CF(Y, T, X, W, X_test):

    est = CausalForestDML(
        model_t=Lasso(alpha=lambda_reg),  # 1st stage on treatment
        model_y=Lasso(alpha=lambda_reg),  # 1st stage on dep
        n_estimators=4000,
        min_samples_leaf=5,
        max_depth=50,
        verbose=0,
        random_state=123,
    )

    est.tune(Y, T, X=X, W=W)
    est.fit(Y, T, X=X, W=W)
    treatment_effects = est.effect(X_test)
    te_lower, te_upper = est.effect_interval(X_test, alpha=0.01)

    return treatment_effects, te_lower, te_upper

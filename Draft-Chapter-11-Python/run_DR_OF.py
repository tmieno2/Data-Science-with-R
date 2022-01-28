def run_DR_OF(Y, T, X, W):

    est = DROrthoForest(n_trees=500, model_Y=WeightedLasso(alpha=lambda_reg))

    est.fit(Y, T, X=X, W=W)

    treatment_effects = est.const_marginal_effect(X_test)
    te_lower, te_upper = est.const_marginal_effect_interval(X_test)
    res = est.const_marginal_effect_inference(X_test)

    return treatment_effects, te_lower, te_upper, res

# Using Multinomial

DeepDive supports multinomial variables, which take integer values ranging from 0 to an upper bound. To use a multinomial type variable, first specify the variable in application.conf using type `Categorical(?)`, where `?` is the cardinality of the variable. The schema definition would be like this
  
  schema.variables {
    [table].[column]: Categorical(10)
  }

The factor function for multinomial is `Multinomial`. It is equivalent to having indicator functions for each combination of variable assignments. For examples, if `a` is a variable taking values 0, 1, 2, and `b` is a variable taking values 0, 1. Then, `Multinomial(a, b)` is equivalent to the following factors between a and b
  
  1{a = 0, b = 0}
  1{a = 0, b = 1}
  1{a = 1, b = 0}
  1{a = 1, b = 1}
  1{a = 2, b = 0}
  1{a = 2, b = 1}

DeepDive currently support only this factor function, and will support arbitrary user defined function soon. 

## Multi-class Logistic Regression

Multi-class classification problem can be compactly represented in DeepDive. For each variable to predict, add `Multinomial` factors with weight depending on the feature. For example, if we have a variable table `var`, which has the variable to predict in colomn `value`. We also have a feature table `features` which contains features for the variables. A typical logistic regression inference rule will look like
  
  factor_lr {
    input query: """SELECT var.id AS "var.id", var.value AS "var.value", features.feature as "feature"
      FROM var, features
      WHERE predicate
    function: "Multinomial(var.value)"
    weight: "?(feature)"
  }
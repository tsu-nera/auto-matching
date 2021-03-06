module.exports = {
  root: true,
  env: {
    "node": true,
    "jest/globals": true
  },
  plugins: ["jest", "vue", "import", "prettier"],
  extends: [
    "airbnb-base",
    "eslint:recommended",
    "plugin:vue/recommended",
    "plugin:prettier/recommended",
    "prettier/vue",
  ],
  settings: {
    "import/resolver": {
      node: {
        extensions: [".js", ".jsx", ".ts", ".tsx", ".vue"]
      },
      alias: [
        ['@', "src"],
      ],
    },
    "import/core-modules": [
      'vue', // vueはnuxtが抱えているため明記する必要がある
    ],
  },
  parser: "vue-eslint-parser",
  parserOptions: {
    parser: "typescript-eslint-parser"
  },
  rules: {
    "no-console": 0,
    "no-unused-vars": 0,
    "class-methods-use-this": 0,
    "vue/require-default-prop": 0,
    "vue/max-attributes-per-line": 0,
    "vue/html-closing-bracket-spacing": 0,
    "vue/html-self-closing": 0,
    "vue/singleline-html-element-content-newline": 0,
    "vue/component-name-in-template-casing": 0,
    "vue/require-prop-types": 0,
    "no-restricted-syntax": 0,
    "no-param-reassign": 0,
    "import/prefer-default-export": 0,
    "import/no-dynamic-require": 0,
    "prefer-destructuring": 0,
    "import/no-unresolved": 0,
    "no-underscore-dangle": 0,
  }
};

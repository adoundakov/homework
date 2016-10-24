// where action craetors will live

function selectCurrency(baseCurrency, rates) {
  return ({
    type: 'SWITCH_CURRENCY',
    baseCurrency,
    rates
  });
}


export default selectCurrency;

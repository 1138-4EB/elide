function wave(bits, ticks) {
   var i, t, gray, state, data = [], arr = [];
   for (i = 0; i < bits; i++) {
      arr.push({name: i + '', wave: ''});
      state = 1;
      for (t = 0; t < ticks; t++) {
         data.push(t + '');
         gray = (((t >> 1) ^ t) >> i) & 1;
         arr[i].wave += (gray === state) ? '.' : gray + '';
         state = gray;
      }
   }
   arr.unshift('gray');
   return {signal: [ {name: 'bin', wave: '='.repeat(ticks), data: data}, arr ]};
}

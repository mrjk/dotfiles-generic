
if command -v mani >&/dev/null; then
  if type _get_comp_words_by_ref >/dev/null 2>&1; then
    eval "$(mani completion bash)"
  fi
fi


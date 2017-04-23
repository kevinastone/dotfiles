begin
    set vf_eval (python -m virtualfish auto_activation 2>/dev/null); and eval $vf_eval
end 2>&1 >/dev/null

def clamp(val, min_val, max_val):
    result = min(max(val, min_val), max_val)
    return result
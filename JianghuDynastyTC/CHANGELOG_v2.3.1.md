# Jianghu Dynasty v2.3.1 - Balance and Event Stability

- Balanced decision cooldowns between two and eight years.
- Kept rewards modest: small prestige, temporary skill/prowess bonuses, stress relief, and limited opinion/reputation effects.
- Disabled AI decision use with `ai_check_interval = 0` and `is_ai = no` visibility.
- Avoided on_action loops, yearly all-character scans, heavy random pulses, and long chains.
- Verified every active event option exits cleanly and only applies existing JDTC modifiers.

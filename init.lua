-- speedsup start of lua
-- check if impatient import works to skip if it fails
local module_status_ok, _ = pcall(require, "impatient")
if not module_status_ok then
    print("impatient not found.")
  return
end

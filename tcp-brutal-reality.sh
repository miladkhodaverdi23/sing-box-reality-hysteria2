
#!/bin/bash

# نمایش با تاخیر
print_with_delay() {
    text="$1"
    delay="$2"
    for ((i = 0; i < ${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep "$delay"
    done
    echo
}
# متن رنگی
warning() { echo -e "\033[31m\033[01m$*\033[0m"; }  # قرمز
error() { echo -e "\033[31m\033[01m$*\033[0m" && exit 1; } # قرمز
info() { echo -e "\033[32m\033[01m$*\033[0m"; }   # سبز
hint() { echo -e "\033[33m\033[01m$*\033[0m"; }   # زرد
# نمایش وضعیت سیستم و اطلاعات singbox
show_status(){
    singbox_pid=$(pgrep sing-box)
    singbox_status=$(systemctl is-active sing-box)
    if [ "$singbox_status" == "active" ]; then
        cpu_usage=$(ps -p $singbox_pid -o %cpu | tail -n 1)
        memory_usage_mb=$(( $(ps -p "$singbox_pid" -o rss | tail -n 1) / 1024 ))

        p_latest_version_tag=$(curl -s "https://api.github.com/repos/SagerNet/sing-box/releases" | jq -r '[.[] | select(.prerelease==true)][0].tag_name')
        latest_version_tag=$(curl -s "https://api.github.com/repos/SagerNet/sing-box/releases" | jq -r '[.[] | select(.prerelease==false)][0].tag_name')

        latest_version=${latest_version_tag#v}  # حذف پیشوند 'v' از شماره نسخه
        p_latest_version=${p_latest_version_tag#v}  # حذف پیشوند 'v' از شماره نسخه

        iswarp=$(grep '^WARP_ENABLE=' /root/sbox/config | cut -d'=' -f2)

        warning "وضعیت سرویس SING-BOX:"
        hint "========================="
        info "وضعیت: در حال اجرا"
        info "استفاده از CPU: $cpu_usage%"
        info "استفاده از حافظه: ${memory_usage_mb}MB"
        info "آخرین نسخه آزمایشی singbox: $p_latest_version"
        info "آخرین نسخه رسمی singbox: $latest_version"
        info "نسخه فعلی singbox (ورود با 4 برای مدیریت): $(/root/sbox/sing-box version 2>/dev/null | awk '/version/{print $NF}')"
        info "باز کردن قفل warp استریم‌های رسانه‌ای (ورود با 6 برای مدیریت): $(if [ "$iswarp" == "TRUE" ]; then echo "فعال"; else echo "غیرفعال"; fi)"
        hint "========================="
    else
        warning "SING-BOX در حال اجرا نیست!"
    fi

}
# نمایش اعلان‌ها
show_notice() {
    local message="$1"
    local reset="\e[0m"
    local bold="\e[1m"
    local terminal_width=$(tput cols)
    local line=""
    local padding=$(( (terminal_width - ${#message}) / 2 ))
    local padded_message="$(printf "%*s%s" $padding '' "$message")"
    for ((i=1; i<=terminal_width; i++)); do
        line+="*"
    done
    warning "${bold}${line}${reset}"
    echo ""
    warning "${bold}${padded_message}${reset}"
    echo ""
    warning "${bold}${line}${reset}"
}
# نصب بسته‌ها
install_pkgs() {
  # نصب qrencode، jq، و iptables در صورت عدم نصب
  local pkgs=("qrencode" "jq" "iptables")
  for pkg in "${pkgs[@]}"; do
    if command -v "$pkg" &> /dev/null; then
      echo "$pkg نصب شده است."
    else
      echo "در حال نصب $pkg..."
      if command -v apt &> /dev/null; then
        sudo apt update > /dev/null 2>&1 && sudo apt install -y "$pkg" > /dev/null 2>&1
      elif command -v yum &> /dev/null; then
        sudo yum install -y "$pkg"
      elif command -v dnf &> /dev/null; then
        sudo dnf install -y "$pkg"
      else
        error "عدم توانایی در نصب $pkg. لطفاً به صورت دستی نصب کنید و دوباره این اسکریپت را اجرا کنید."
      fi
      echo "$pkg نصب شده است."
    fi
  done
}

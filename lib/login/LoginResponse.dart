
class LoginResponse {
    String date_format;
    String date_sep;
    String dec_sep;
    String def_print_destination;
    String def_print_orientation;
    String email;
    String graphic_links;
    String id;
    String inactive;
    String language;
    String last_visit_date;
    String page_size;
    String password;
    String percent_dec;
    String phone;
    String pos;
    String prices_dec;
    String print_profile;
    String qty_dec;
    String query_size;
    String rates_dec;
    String real_name;
    String rep_popup;
    String role_id;
    String save_report_selections;
    String show_codes;
    String show_gl;
    String show_hints;
    String startup_tab;
    String sticky_doc_date;
    String theme;
    String tho_sep;
    String transaction_days;
    String use_date_picker;
    String user_id;

    LoginResponse({this.date_format, this.date_sep, this.dec_sep, this.def_print_destination, this.def_print_orientation, this.email, this.graphic_links, this.id, this.inactive, this.language, this.last_visit_date, this.page_size, this.password, this.percent_dec, this.phone, this.pos, this.prices_dec, this.print_profile, this.qty_dec, this.query_size, this.rates_dec, this.real_name, this.rep_popup, this.role_id, this.save_report_selections, this.show_codes, this.show_gl, this.show_hints, this.startup_tab, this.sticky_doc_date, this.theme, this.tho_sep, this.transaction_days, this.use_date_picker, this.user_id});

    factory LoginResponse.fromJson(Map<String, dynamic> json) {
        return LoginResponse(
            date_format: json['date_format'], 
            date_sep: json['date_sep'], 
            dec_sep: json['dec_sep'], 
            def_print_destination: json['def_print_destination'], 
            def_print_orientation: json['def_print_orientation'], 
            email: json['email'], 
            graphic_links: json['graphic_links'], 
            id: json['id'], 
            inactive: json['inactive'], 
            language: json['language'], 
            last_visit_date: json['last_visit_date'], 
            page_size: json['page_size'], 
            password: json['password'], 
            percent_dec: json['percent_dec'], 
            phone: json['phone'], 
            pos: json['pos'], 
            prices_dec: json['prices_dec'], 
            print_profile: json['print_profile'], 
            qty_dec: json['qty_dec'], 
            query_size: json['query_size'], 
            rates_dec: json['rates_dec'], 
            real_name: json['real_name'], 
            rep_popup: json['rep_popup'], 
            role_id: json['role_id'], 
            save_report_selections: json['save_report_selections'], 
            show_codes: json['show_codes'], 
            show_gl: json['show_gl'], 
            show_hints: json['show_hints'], 
            startup_tab: json['startup_tab'], 
            sticky_doc_date: json['sticky_doc_date'], 
            theme: json['theme'], 
            tho_sep: json['tho_sep'], 
            transaction_days: json['transaction_days'], 
            use_date_picker: json['use_date_picker'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date_format'] = this.date_format;
        data['date_sep'] = this.date_sep;
        data['dec_sep'] = this.dec_sep;
        data['def_print_destination'] = this.def_print_destination;
        data['def_print_orientation'] = this.def_print_orientation;
        data['email'] = this.email;
        data['graphic_links'] = this.graphic_links;
        data['id'] = this.id;
        data['inactive'] = this.inactive;
        data['language'] = this.language;
        data['last_visit_date'] = this.last_visit_date;
        data['page_size'] = this.page_size;
        data['password'] = this.password;
        data['percent_dec'] = this.percent_dec;
        data['phone'] = this.phone;
        data['pos'] = this.pos;
        data['prices_dec'] = this.prices_dec;
        data['print_profile'] = this.print_profile;
        data['qty_dec'] = this.qty_dec;
        data['query_size'] = this.query_size;
        data['rates_dec'] = this.rates_dec;
        data['real_name'] = this.real_name;
        data['rep_popup'] = this.rep_popup;
        data['role_id'] = this.role_id;
        data['save_report_selections'] = this.save_report_selections;
        data['show_codes'] = this.show_codes;
        data['show_gl'] = this.show_gl;
        data['show_hints'] = this.show_hints;
        data['startup_tab'] = this.startup_tab;
        data['sticky_doc_date'] = this.sticky_doc_date;
        data['theme'] = this.theme;
        data['tho_sep'] = this.tho_sep;
        data['transaction_days'] = this.transaction_days;
        data['use_date_picker'] = this.use_date_picker;
        data['user_id'] = this.user_id;
        return data;
    }
}
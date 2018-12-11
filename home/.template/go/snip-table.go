	tests := []struct {
		name string
		{{_cursor_}}
		want  string
		wantError bool
		err       error
	}{
		{
			subject: "",
			want: "",
			wantError: true,
			// err: fmt.Errorf(""),
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := ""

			if !tt.wantError && err != nil {
				t.Fatalf("want no err, but has error %#v", err)
			}
			if tt.wantError && !reflect.DeepEqual(err, tt.err) {
				t.Fatalf("want %#v, but %#v", tt.err, err)
			}
			// if !tt.wantError && got != tt.want {
			// 	t.Fatalf("want %q, but %q", tt.want, got)
			// }

			if s != tt.want {
				t.Errorf("want %#v, but got %#v", tt.want, got)
			}
		})
	}

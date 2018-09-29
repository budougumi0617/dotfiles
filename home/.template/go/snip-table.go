	tests := []struct {
		subject string
		{{_cursor_}}
		want  string
	}{
		{
			subject: "",
			got: "",
		},
	}
	for _, tt := range tests {
		t.Run(tt.subject, func(t *testing.T) {
			got := ""
			if s != tt.want {
				t.Errorf("want %#v, but got %#v", tt.want, got)
			}
		})
	}

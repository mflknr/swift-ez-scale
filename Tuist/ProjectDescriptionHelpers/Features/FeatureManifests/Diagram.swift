extension Feature {
	static var diagram: Feature {
		.feature(
			name: "Diagram",
			layers: [
				.layer(type: .presentation),
				.layer(type: .domain),
				.layer(type: .data)
			]
		)
	}
}

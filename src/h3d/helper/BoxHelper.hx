package h3d.helper;

class BoxHelper extends h3d.scene.Graphics {

	public var mesh(default,null) : Mesh;

	public function new( mesh : Mesh, parent : Object, color = 0xFFFF00, lineWidth = 2.0 ) {
		
		super( parent );
		this.mesh = mesh;
		
		material.props = h3d.mat.MaterialSetup.current.getDefaults( "ui" );
		lineShader.width = lineWidth;
		
		var bounds = mesh.primitive.getBounds();

		setColor( color );

		moveTo( bounds.xMin, bounds.yMin, bounds.zMin );
		lineTo( bounds.xMax, bounds.yMin, bounds.zMin );
		lineTo( bounds.xMax, bounds.yMax, bounds.zMin );
		lineTo( bounds.xMin, bounds.yMax, bounds.zMin );
		lineTo( bounds.xMin, bounds.yMin, bounds.zMin );
		
		moveTo( bounds.xMin, bounds.yMin, bounds.zMax );
		lineTo( bounds.xMax, bounds.yMin, bounds.zMax );
		lineTo( bounds.xMax, bounds.yMax, bounds.zMax );
		lineTo( bounds.xMin, bounds.yMax, bounds.zMax );
		lineTo( bounds.xMin, bounds.yMin, bounds.zMax );

		moveTo( bounds.xMin, bounds.yMin, bounds.zMin );
		lineTo( bounds.xMin, bounds.yMin, bounds.zMax );
		
		moveTo( bounds.xMin, bounds.yMax, bounds.zMin );
		lineTo( bounds.xMin, bounds.yMax, bounds.zMax );

		moveTo( bounds.xMax, bounds.yMin, bounds.zMin );
		lineTo( bounds.xMax, bounds.yMin, bounds.zMax );
	
		moveTo( bounds.xMax, bounds.yMax, bounds.zMin );
		lineTo( bounds.xMax, bounds.yMax, bounds.zMax );

		this.setPosition( mesh.x, mesh.y, mesh.z );
	}

	override function sync( ctx : RenderContext ) {
		//super.sync(ctx);
		this.setPosition( mesh.x, mesh.y, mesh.z );
		this.syncPos();
	}
}

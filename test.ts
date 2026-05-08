class Person {
	private _name: string | null = null;
	private _age: number | null = null;

	constructor(name: string = '') {
		this._name = name;
	}

	public get name() {
		return this._name;
	}

	public get age() {
		return this._age;
	}
}

const person: Person = new Person('Vasya');
console.log(person.name);


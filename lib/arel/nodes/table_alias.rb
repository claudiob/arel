module Arel
  module Nodes
    class TableAlias
      attr_reader :name, :relation, :columns

      def initialize name, relation
        @name     = name
        @relation = relation
        @columns  = relation.columns.map { |column|
          column.dup.tap { |col| col.relation = self }
        }
      end

      def [] name
        name = name.to_s
        columns.find { |column| column.name == name }
      end
    end
  end
end